require 'rails_helper'

describe "User can create a new category" do
  it "user creates new category with form and is
    redirected to that category show page" do

    visit new_category_path

    fill_in "category[title]", with: "Technology"

    click_on "Create Category"

    expect(current_path).to eq category_path(Category.last)
    expect(page).to have_content "Technology"
  end

  it "if user tries to create an existing category
      he/she will be redirected to create new category form" do
      category = Category.create!(title: "Fisherman")

      visit new_category_path

      fill_in "category[title]", with: "Fisherman"

      click_on "Create Category"

      expect(current_path).to eq new_category_path
  end
end
