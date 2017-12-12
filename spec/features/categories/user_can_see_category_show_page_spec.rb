require 'rails_helper'

describe "When user visits category show path" do
  it "sees a show page for single category" do
    category = Category.create!(title: "Fishing")

    visit category_path(category)

    expect(page).to have_content category.title 
  end
end
