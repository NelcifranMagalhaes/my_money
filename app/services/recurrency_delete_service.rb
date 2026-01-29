class RecurrencyDeleteService
  def initialize(money_out)
    @money_out = money_out
  end

  def perform
    return unless @money_out.recurrency.present? && @money_out.recurrency > 1

    future_recurrences = MoneyOut.where(original_money_out_id: @money_out.id)
                                 .where("money_date > ?", @money_out.money_date)

    future_recurrences.each do |recurrence|
      recurrence.destroy!
    end
  end
end
