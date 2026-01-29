class RecurrencyCreateService
  def initialize(money_out)
    @money_out = money_out
  end

  def perform
    return unless @money_out.recurrency.present? && @money_out.recurrency > 1

    (@money_out.recurrency_quantity - 1).times do |i|
      new_money_out = @money_out.dup
      new_money_out.money_date = @money_out.money_date + (i + 1).months
      new_money_out.recurrency = false
      new_money_out.recurrency_quantity = 0
      new_money_out.original_money_out_id = @money_out.id
      new_money_out.save!
    end
  end
end