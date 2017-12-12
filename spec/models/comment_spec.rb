require 'rails_helper'

describe Comment do
  describe "Validations" do
    it "is invalid without content" do
      comment = Comment.new
      expect(comment).to be_invalid
    end

    it "is valid with content" do
      category = Category.create(title: "Software")
      company = Company.create(name: "Dropbox")
      job = Job.create!(title: "Software", level_of_interest: 70, description: "Wahooo",
        city: "Denver", company_id: company.id, category_id: category.id)
      comment = Comment.new(content: "Good job", job_id: job.id)
      expect(comment).to be_valid
    end
  end

  describe "Relationships" do
    it "belongs to a job" do
      category = Category.create(title: "Software")
      company = Company.create(name: "Dropbox")
      job = Job.create!(title: "Software", level_of_interest: 70, description: "Wahooo",
        city: "Denver", company_id: company.id, category_id: category.id)
      comment = Comment.new(content: "Good job", job_id: job.id)
      expect(comment).to respond_to(:job)
    end
  end
end
