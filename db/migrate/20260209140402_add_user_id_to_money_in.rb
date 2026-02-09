class AddUserIdToMoneyIn < ActiveRecord::Migration[8.1]
  def change
    add_reference :money_ins, :user, foreign_key: true
  end
end
