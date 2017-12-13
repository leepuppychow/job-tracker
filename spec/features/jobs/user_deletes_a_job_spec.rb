require 'rails_helper'

describe "User can delete a job" do
  it "user can delete an existing job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Software")
    job = company.jobs.create!(title: "Developer",
                              level_of_interest: 70,
                              city: "Denver",
                              company_id: company.id,
                              category_id: category.id)

    visit company_path(company)

    click_link "Delete"

    expect(page).to have_content("#{job.title} was successfully deleted!")
  end
end
