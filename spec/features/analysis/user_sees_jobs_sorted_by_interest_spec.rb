require 'rails_helper'

describe "when user visits path /jobs?sort=interest" do
  it "sees a page all jobs sorted by city with their count" do
    create_list(:job, 4, {level_of_interest: 80})
    create_list(:job, 3, {level_of_interest: 70})
    create_list(:job, 6, {level_of_interest: 60})


    visit "/jobs?sort=interest"

    expect(page).to have_content "Jobs sorted by level of interest"
    expect(page).to have_content "Tokyo: 6"
    expect(page).to have_content "Denver: 4"
    expect(page).to have_content "Taipei: 3"
  end
end
