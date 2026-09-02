class AddDebtorToMoneyIn < ActiveRecord::Migration[8.1]
  def change
    add_column :money_ins, :debtor_id, :integer, default: nil
  end
end
