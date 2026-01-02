class MoneyOut < ApplicationRecord
  belongs_to :category
  validates :label, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :money_date, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ "amount", "category_id", "description", "label", "money_date" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "category" ]
  end
end
