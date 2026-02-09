class AddUserIdToMoneyOut < ActiveRecord::Migration[8.1]
  def change
    add_reference :money_outs, :user, foreign_key: true
  end
end
