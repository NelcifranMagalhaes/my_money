class CreateMoneyIns < ActiveRecord::Migration[8.1]
  def change
    create_table :money_ins do |t|
      t.string :label
      t.string :description
      t.date :money_date
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
