require 'rails_helper'

describe "When user visits category index path" do
  before(:each) do
    CATEGORIES = ["Technology", "Business", "Engineering", "Education", "Human Resources"]
    CATEGORIES.each do |title|
      category = Category.create!(title: title)
    end
  end

  it "sees a list of all categories with links to category show page,
      delete, and edit links " do
    visit categories_path

    expect(page).to have_content("All Categories")
    expect(page).
  end
end
