require 'rails_helper'

describe Contact do
  describe "Validations" do
    it "is valid with full name, position, and email" do
      contact = create(:contact)
      expect(contact).to be_valid
    end

    it "is invalid without a full name" do
      contact = Contact.new(position: "fhdfs", email: "ghsjg")
      expect(contact).to be_invalid
    end

    it "is invalid without a position" do
      contact = Contact.new(full_name: "fhdfs", email: "ghsjg")
      expect(contact).to be_invalid
    end

    it "is invalid without an email" do
      contact = Contact.new(position: "fhdfs", full_name: "ghsjg")
      expect(contact).to be_invalid
    end
  end

  describe "Relationships" do
    it "belongs to a company" do
      contact = create(:contact)

      expect(contact).to respond_to(:company)
    end
  end
end
