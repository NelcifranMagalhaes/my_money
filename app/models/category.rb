class Category < ApplicationRecord
  validates :name, presence: true
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    [ "name" ]
  end
end
