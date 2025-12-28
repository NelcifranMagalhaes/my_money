class CreateMoneyOuts < ActiveRecord::Migration[8.1]
  def change
    create_table :money_outs do |t|
      t.string :label
      t.string :description
      t.date :money_date
      t.decimal :amount
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
