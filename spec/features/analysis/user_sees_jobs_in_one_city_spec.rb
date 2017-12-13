require 'rails_helper'

describe "when user visits path such as /jobs?location=Denver" do
  it "sees a page with all jobs in this city" do
    job1 = create(:job, city: "Denver")
    job2 = create(:job, city: "Denver")

    visit "/jobs?location=Denver"

    expect(page).to have_content("Jobs in Denver")
    expect(page).to have_content job1.title
    expect(page).to have_content job2.title
  end
end
