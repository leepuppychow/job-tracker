require 'rails_helper'

describe "User can edit an existing job" do
  it "can edit an existing job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Software")
    job = company.jobs.create!(title: "Developer",
                              level_of_interest: 70,
                              city: "Denver",
                              company_id: company.id,
                              category_id: category.id)


    visit edit_company_job_path(company, job)


    expect(page).to have_content("Edit Job")
    expect(find_field("job[title]").value).to eq("Developer")
    expect(find_field("job[level_of_interest]").value).to eq("70")
    expect(find_field("job[city]").value).to eq("Denver")

    fill_in "job[title]", with: "Software Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Seattle"

    click_button "Update Job"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Software Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Seattle")
  end
end
