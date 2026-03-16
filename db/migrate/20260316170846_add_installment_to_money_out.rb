class AddInstallmentToMoneyOut < ActiveRecord::Migration[8.1]
  def change
    add_column :money_outs, :installment, :integer, default: 0
  end
end
