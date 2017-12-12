require 'rails_helper'

describe "User sees a specific job" do
  before(:each) do
    @company = Company.create!(name: "ESPN")
    @category = Category.create!(title: "Software")
    @job = @company.jobs.create!(title: "Developer", level_of_interest: 70,
      city: "Denver", category_id: @category.id)

    visit company_job_path(@company, @job)
  end

  scenario "a user sees a job for a specific company" do
    expect(page).to have_content(@company.name)
    expect(page).to have_content(@job.title)
    expect(page).to have_content(@job.level_of_interest)
    expect(page).to have_content(@job.city)
  end

  it "a user can add comments for that specific job" do
    expect(page).to have_content "Add Comment"
  end
end
