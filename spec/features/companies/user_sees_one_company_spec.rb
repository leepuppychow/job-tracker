require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Software")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)

    visit company_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end

  it "sees a form to enter a new Contact" do
    company = create(:company)

    visit company_path(company)

    expect(page).to have_content("Contacts")

    fill_in "contact[full_name]", with: "Lee"
    fill_in "contact[position]", with: "Student"
    fill_in "contact[email]", with: "email!"
    click_button "Create Contact"

    expect(current_path).to eq company_path(company)
    expect(page).to have_content "Lee"
    expect(page).to have_content "Student"
    expect(page).to have_content "email!"

    fill_in "contact[full_name]", with: "Jay"
    fill_in "contact[position]", with: "Brother"
    fill_in "contact[email]", with: "email2!"
    click_button "Create Contact"

    expect(current_path).to eq company_path(company)
    expect(page).to have_content "Jay"
    expect(page).to have_content "Brother"
    expect(page).to have_content "email2!"
  end
end
