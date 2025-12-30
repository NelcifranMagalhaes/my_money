class DashboardController < ApplicationController
  def index
    @money_out_in_current_month = MoneyOut
                                        .where(money_date: Time.current.beginning_of_month..Time.current.end_of_month)
                                        .sum(:amount)

    @money_in_in_current_month = MoneyIn
                                      .where(money_date: Time.current.beginning_of_month..Time.current.end_of_month)
                                      .sum(:amount)

    @money_out_by_category = MoneyOut
                   .joins(:category)
                   .where(money_date: Time.current.beginning_of_month..Time.current.end_of_month)
                   .group("categories.name")
                   .sum(:amount)

    start_month = Time.current.beginning_of_month - 5.months

    @money_out_by_month = MoneyOut
             .where(money_date: start_month..Time.current.end_of_month)
             .group(Arel.sql("DATE_TRUNC('month', money_date)::date"))
             .order(Arel.sql("DATE_TRUNC('month', money_date)::date"))
             .sum(:amount)

    @most_expensive_money_outs = MoneyOut
                                      .where(money_date: Time.current.beginning_of_month..Time.current.end_of_month)
                                      .order(amount: :desc)
                                      .limit(5)

    @how_many_money_have = @money_in_in_current_month - @money_out_in_current_month
  end
end
