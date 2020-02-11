require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    subject { described_class.new(name: "anything", price: 213, quantity: 4, category: Category.new()) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it "is not valid without a price" do
      subject.price = ""
      subject.valid?
      expect(subject.errors[:price]).to include("is not a number")
    end

    it "is not valid without a quantity" do
      subject.quantity = nil
      subject.valid?
      expect(subject.errors[:quantity]).to include("can't be blank")
    end

    it "is not valid without a category" do
      subject.category = nil
      subject.valid?
      expect(subject.errors[:category]).to include("can't be blank")
    end
  end
end
