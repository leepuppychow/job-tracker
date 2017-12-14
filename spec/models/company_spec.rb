require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end

    it "has many contacts" do
      company = create(:company)
      expect(company).to respond_to(:contacts)
    end
  end

  describe "Class Methods" do
    it ".top_3_ranked_by_avg_level_of_interest" do
      c1,c2,c3,c4 = create_list(:company, 4)
      create_list(:job, 5, {company_id: c1.id, level_of_interest: 10})
      create_list(:job, 5, {company_id: c3.id, level_of_interest: 30})
      create_list(:job, 5, {company_id: c2.id, level_of_interest: 50})
      create_list(:job, 5, {company_id: c4.id, level_of_interest: 70})
      expected = [[c4.name,70],[c2.name,50],[c3.name,30]]

      expect(Company.top_3_ranked_by_avg_level_of_interest).to eq expected
    end
  end
end
