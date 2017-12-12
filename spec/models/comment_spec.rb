require 'rails_helper'

describe Comment do
  describe "Validations" do
    it "is invalid without content" do
      comment = Comment.new
      expect(comment).to be_invalid
    end

    it "is valid with content" do
      comment = build(:comment)
      expect(comment).to be_valid
    end
  end

  describe "Relationships" do
    it "belongs to a job" do
      comment = build(:comment)
      expect(comment).to respond_to(:job)
    end
  end
end
