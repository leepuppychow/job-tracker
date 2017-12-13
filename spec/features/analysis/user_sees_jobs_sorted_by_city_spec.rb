require 'rails_helper'

describe "when user visits path /jobs?sort=location" do
  it "sees a page all jobs sorted by city with their count" do
    create_list(:job, 4, {city: "Denver"})
    create_list(:job, 3, {city: "Taipei"})
    create_list(:job, 6, {city: "Tokyo"})

    visit "/jobs?sort=location"

    expect(page).to have_content "Jobs sorted by location"
    expect(page).to have_content "Tokyo: 6"
    expect(page).to have_content "Denver: 4"
    expect(page).to have_content "Taipei: 3"
  end
end
