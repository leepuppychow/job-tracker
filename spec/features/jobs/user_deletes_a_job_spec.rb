require 'rails_helper'

describe "User can delete a job" do
  it "user can delete an existing job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer",
                              level_of_interest: 70,
                              city: "Denver",
                              company_id: company.id)

    visit company_jobs_path(company)

    click_link "Delete"

    expect(page).to have_content("Developer was successfully deleted!")
  end
end