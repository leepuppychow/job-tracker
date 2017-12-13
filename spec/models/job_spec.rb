require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category_id: 1)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver", category_id: 1)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80, category_id: 1)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, company, and category" do
        company = Company.new(name: "Turing")
        category = Category.create!(title: "Software")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end

    it "belongs to a category" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:category)
    end

    it "has many comments" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:comments)
    end
  end

  describe "Class methods" do
    it ".grouped_by_level_of_interest" do
      create_list(:job, 3, {title: "Developer", level_of_interest: 50})
      create_list(:job, 2, {title: "QA", level_of_interest: 40})
      create_list(:job, 1, {title: "Engineer", level_of_interest: 100})
      expected = {100=>1, 50=>3, 40=>2}

      expect(Job.grouped_by_level_of_interest).to eq expected
    end

    it ".grouped_by_location" do
      create_list(:job, 3, {city: "Denver"})
      create_list(:job, 2, {city: "Tokyo"})
      create_list(:job, 1, {city: "Taipei"})
      expected = {"Denver"=>3, "Tokyo"=>2, "Taipei"=>1}

      expect(Job.grouped_by_location).to eq expected
    end

    it ".jobs_in_city finds jobs in one city" do
      create_list(:job, 3, {city: "Denver"})
      create_list(:job, 2, {city: "Tokyo"})
      create_list(:job, 1, {city: "Taipei"})

      expect(Job.jobs_in_city("Denver").count).to eq 3
      expect(Job.jobs_in_city("Taipei").count).to eq 1
    end

    it ".sorted_by_location sorts jobs alphabetically by city" do
      job1 = create(:job, city: "Denver")
      job2 = create(:job, city: "Austin")
      job3 = create(:job, city: "San Diego")

      expect(Job.sorted_by_location).to eq [job2, job1, job3]
    end

    it ".sorted_by_level_of_interest sorts jobs by interest level" do
      job1 = create(:job, level_of_interest: 60)
      job2 = create(:job, level_of_interest: 90)
      job3 = create(:job, level_of_interest: 30)

      expect(Job.sorted_by_level_of_interest).to eq [job2, job1, job3]
    end

    it ".jobs_in_city(city) finds all jobs in one city" do
      job1 = create(:job, city: "Denver")
      job2 = create(:job, city: "Austin")
      job3 = create(:job, city: "Denver")

      expect(Job.jobs_in_city("Denver")).to eq [job1, job3]

    end
  end
end
