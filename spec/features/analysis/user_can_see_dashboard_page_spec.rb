require 'rails_helper'

describe "When user visits /dashboard route" do
  it "sees a count of jobs sorted by level of interest" do
    create_list(:job, 3, {title: "Developer", level_of_interest: 50})
    create_list(:job, 2, {title: "QA", level_of_interest: 40})
    create_list(:job, 1, {title: "Engineer", level_of_interest: 100})

    visit "/dashboard"

    expect(page).to have_content "Jobs sorted by level of interest"
    expect(page).to have_content "Developer: 3"
    expect(page).to have_content "QA: 2"
    expect(page).to have_content "Engineer: 1"
  end

  it "sees a count of jobs sorted by location" do
    create_list(:job, 3, {city: "Denver"})
    create_list(:job, 2, {city: "Tokyo"})
    create_list(:job, 1, {city: "Taipei"})

    visit "/dashboard"

    expect(page).to have_content "Jobs sorted by location"
    expect(page).to have_content "Taipei"
    expect(page).to have_content 1
    expect(page).to have_content "Denver"
    expect(page).to have_content 3
    expect(page).to have_content "Tokyo"
    expect(page).to have_content 2
  end

  it "sees the top 3 companies ranked by average level of interest" do
    c1,c2,c3,c4 = create_list(:company, 4)
    create_list(:job, 5, {company_id: c1.id, level_of_interest: 10})
    create_list(:job, 5, {company_id: c3.id, level_of_interest: 30})
    create_list(:job, 5, {company_id: c2.id, level_of_interest: 50})
    create_list(:job, 5, {company_id: c4.id, level_of_interest: 70})

    visit "/dashboard"

    expect(page).to have_content "First: #{c4.name}"
    expect(page).to have_content "Second: #{c2.name}"
    expect(page).to have_content "Third: #{c3.name}"
  end
end
