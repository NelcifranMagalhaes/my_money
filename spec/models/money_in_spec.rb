require 'rails_helper'

RSpec.describe MoneyIn, type: :model do
  subject { MoneyIn.new(amount: 150.0, description: "Freelance project payment",
   label: "Freelance", money_date: Date.today, category: Category.new(name: "Salary")) }
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
end
