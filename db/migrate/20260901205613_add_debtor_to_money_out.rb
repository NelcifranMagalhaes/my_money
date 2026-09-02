class AddDebtorToMoneyOut < ActiveRecord::Migration[8.1]
  def change
    add_column :money_outs, :debtor_id, :integer, default: nil
  end
end
