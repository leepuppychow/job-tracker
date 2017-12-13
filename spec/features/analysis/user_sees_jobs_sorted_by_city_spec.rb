require 'rails_helper'

describe "when user visits path /jobs?sort=location" do
  it "sees a page all jobs sorted by city" do
    job1 = create(:job, city: "Denver")
    job2 = create(:job, city: "Austin")
    job3 = create(:job, city: "San Diego")

    visit "/jobs?sort=location"

    expect(page).to have_content "Jobs sorted by location"
    expect(page).to have_content "#{job1.title} - Denver"
    expect(page).to have_content "#{job2.title} - Austin"
    expect(page).to have_content "#{job3.title} - San Diego"
  end
end
