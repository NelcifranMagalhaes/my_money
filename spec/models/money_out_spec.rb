require 'rails_helper'

RSpec.describe MoneyOut, type: :model do
    subject { MoneyOut.new(amount: 150.0, description: "Grocery shopping",
   label: "Food", money_date: Date.today, category: Category.new(name: "Food")) }
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without an amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a category' do
      subject.category = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a money_date' do
      subject.money_date = nil
      expect(subject).to_not be_valid
    end
  end
  describe 'Associations' do
    it 'belongs to a category' do
      assoc = MoneyOut.reflect_on_association(:category)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
