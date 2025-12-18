class MoneyOut < ApplicationRecord
  belongs_to :category
  validates :label, :money_date, presence: true
end
