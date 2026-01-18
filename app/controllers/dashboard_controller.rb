class DashboardController < ApplicationController
  def index
    if params[:month].present?
      if params[:month].match(/\A\d{4}-\d{2}\z/)
        year, month = params[:month].split("-").map(&:to_i)
      else
        month = params[:month].to_i
        year = Time.current.year
      end
    else
      year = Time.current.year
      month = Time.current.month
    end

    year, month = check_invalid_month(month) if !(1..12).cover?(month)

    month_start = Date.new(year, month, 1).beginning_of_month
    month_end = Date.new(year, month, 1).end_of_month

    filters(month_start, month_end)
  end

  private

  def filters(month_start, month_end)
    service = FilterService.new(month_start: month_start, month_end: month_end)

    @money_out_in_current_month = service.money_out_in_current_month
    @money_in_in_current_month = service.money_in_in_current_month
    @money_out_by_category = service.money_out_by_category
    @money_out_by_month = service.money_out_by_month
    @most_expensive_money_outs = service.most_expensive_money_outs
    @how_many_money_have = service.how_many_money_have
    @percentage_money_out_by_category = service.percentage_money_out_by_category
  end

  def check_invalid_month(month)
    flash.now[:alert] = "Mês inválido. Usando mês atual."
    return Time.current.year, Time.current.month
  end
end
