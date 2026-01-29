class AddOriginalMoneyOutIdToMoneyOut < ActiveRecord::Migration[8.1]
  def change
    add_column :money_outs, :original_money_out_id, :integer
  end
end
