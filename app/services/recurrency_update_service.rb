class RecurrencyUpdateService
  def initialize(money_out)
    @money_out = money_out
  end

  def perform
    return unless @money_out.recurrency.present? && @money_out.recurrency_quantity > 1

    RecurrencyDeleteService.new(@money_out).perform

    RecurrencyCreateService.new(@money_out).perform
  end
end
