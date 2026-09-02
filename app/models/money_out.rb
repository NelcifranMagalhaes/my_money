class MoneyOut < ApplicationRecord
  belongs_to :category
  belongs_to :original_money_out, class_name: "MoneyOut", optional: true
  belongs_to :user
  belongs_to :debtor, optional: true
  validates :label, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :money_date, presence: true
  validates :recurrency_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, if: :recurrency?
  validates :debtor_id, presence: true, if: :debtor?

  def self.ransackable_attributes(auth_object = nil)
    [ "amount", "category_id", "description", "label", "money_date", "debtor_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "category", "user", "debtor" ]
  end

  def debtor?
    category&.debtor?
  end
end
