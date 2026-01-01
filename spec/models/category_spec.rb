require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { Category.new(name: "Utilities", description: "Monthly utility bills") }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'is valid without an description' do
      subject.description = nil
      expect(subject).to be_valid
    end
  end
end
