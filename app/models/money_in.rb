class MoneyIn < ApplicationRecord
  validates :label, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :money_date, presence: true

  belongs_to :category
end
