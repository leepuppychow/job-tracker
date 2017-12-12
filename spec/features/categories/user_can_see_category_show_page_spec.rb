require 'rails_helper'

describe "When user visits category show path" do
  it "sees a show page for single category" do
    category = Category.create!(title: "Fishing")
    company = Company.create!(name: "Yo")
    category.jobs.create!(title: "Captain",
                description: "Yep",
                level_of_interest: 40,
                city: "Denver",
                company_id: company.id,
                category_id: category.id)
    category.jobs.create!(title: "Fisherman",
                description: "Yep",
                level_of_interest: 80,
                city: "Denver",
                company_id: company.id,
                category_id: category.id)

    visit category_path(category)

    save_and_open_page

    expect(page).to have_content category.title
    expect(page).to have_content "Captain"
    expect(page).to have_content "Fisherman"
  end
end
