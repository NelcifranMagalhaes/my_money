class FilterService
  def initialize(month_start:, month_end:)
    @month_start = month_start
    @month_end = month_end
  end

  def money_out_in_current_month
    MoneyOut
      .where(money_date: @month_start..@month_end)
      .sum(:amount)
  end

  def money_in_in_current_month
    MoneyIn
      .where(money_date: @month_start..@month_end)
      .sum(:amount)
  end

  def money_out_by_category
    MoneyOut
      .joins(:category)
      .where(money_date: @month_start..@month_end)
      .group("categories.name")
      .sum(:amount)
  end

  def money_out_by_month
    start_month = @month_start - 5.months
    MoneyOut
      .where(money_date: start_month..@month_end)
      .group(Arel.sql("DATE_TRUNC('month', money_date)::date"))
      .order(Arel.sql("DATE_TRUNC('month', money_date)::date"))
      .sum(:amount)
  end

  def most_expensive_money_outs
    MoneyOut
      .where(money_date: @month_start..@month_end)
      .order(amount: :desc)
      .limit(5)
  end

  def how_many_money_have
    money_in_in_current_month - money_out_in_current_month
  end

  def percentage_money_out_by_category
    total_money_out = money_out_in_current_month.to_f
    return {} if total_money_out.zero?

    money_out_by_category.transform_values do |amount|
      ((amount / total_money_out) * 100).round(2)
    end
  end
end
