require 'spec_helper'

describe "When user clicks on a delete link" do
  it "will delete the individual category and redirect to the category index" do
    category = Category.create!(title: "Fishing")
    start_count = Category.count

    visit categories_path

    within ".category_#{category.id}" do
      click_link "Delete"
    end

    expect(page).to have_content "#{category.title} was deleted!"
    expect(Category.count).to eq (start_count-1)
  end
end
