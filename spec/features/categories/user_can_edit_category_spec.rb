require 'rails_helper'

describe "When user visits category edit path" do
  it "sees a form to edit category information" do
    category = Category.create!(title: "Fishing")

    visit edit_category_path(category)

    expect(page).to have_content "Edit Category"

    fill_in "category[title]", with: "Hunting"
    click_button "Update Category"

    expect(page).to have_content "Hunting"
    expect(page).to_not have_content "Fishing"
  end
end
