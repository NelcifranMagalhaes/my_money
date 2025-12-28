class DashboardController < ApplicationController
  def index
    @money_out_in_current_month = MoneyOut
                                        .where(money_date: Time.current.beginning_of_month..Time.current.end_of_month)
                                        .sum(:amount)

    @money_in_in_current_month = MoneyIn
                                      .where(money_date: Time.current.beginning_of_month..Time.current.end_of_month)
                                      .sum(:amount)
  end
end
