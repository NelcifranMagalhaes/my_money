class MoneyOut < ApplicationRecord
  belongs_to :category
  validates :label, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :money_date, presence: true
end
