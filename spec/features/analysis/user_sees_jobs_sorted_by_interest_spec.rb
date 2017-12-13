require 'rails_helper'

describe "when user visits path /jobs?sort=interest" do
  it "sees a page all jobs sorted by city with their count" do
    job1 = create(:job, level_of_interest: 60)
    job2 = create(:job, level_of_interest: 90)
    job3 = create(:job, level_of_interest: 30)

    visit "/jobs?sort=interest"

    expect(page).to have_content "Jobs sorted by level of interest"
    expect(page).to have_content "#{job1.title}(60)"
    expect(page).to have_content "#{job2.title}(90)"
    expect(page).to have_content "#{job3.title}(30)"
  end
end
