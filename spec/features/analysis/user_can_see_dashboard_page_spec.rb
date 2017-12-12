require 'rails_helper'

describe "When user visits /dashboard route" do
  it "sees a count of jobs sorted by level of interest" do
    create_list(:job, 3, {level_of_interest: 50})
    create_list(:job, 2, {level_of_interest: 40})
    create_list(:job, 1, {level_of_interest: 100})

    visit "/dashboard"

    save_and_open_page

    expect(page).to have_content "Jobs sorted by level of interest"
    expect(page).to have_content 100
    expect(page).to have_content 1
    expect(page).to have_content 50
    expect(page).to have_content 3
    expect(page).to have_content 40
    expect(page).to have_content 2
  end

  it "sees the top 3 companies ranked by average level of interest" do

  end

  it "sees a count of jobs sorted by location" do

  end
end
