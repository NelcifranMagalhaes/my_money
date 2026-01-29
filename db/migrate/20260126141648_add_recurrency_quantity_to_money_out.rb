class AddRecurrencyQuantityToMoneyOut < ActiveRecord::Migration[8.1]
  def change
    add_column :money_outs, :recurrency_quantity, :integer, default: 0
  end
end
