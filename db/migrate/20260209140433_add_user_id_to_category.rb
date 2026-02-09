class AddUserIdToCategory < ActiveRecord::Migration[8.1]
  def change
    add_reference :categories, :user, foreign_key: true
  end
end
