class AddRecurrencyToMoneyOut < ActiveRecord::Migration[8.1]
  def change
    add_column :money_outs, :recurrency, :boolean, default: false
  end
end
