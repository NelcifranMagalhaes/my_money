class Debtor < ApplicationRecord
  belongs_to :user
  has_many :money_outs
  has_many :money_ins
  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ "name" ]
  end
end
