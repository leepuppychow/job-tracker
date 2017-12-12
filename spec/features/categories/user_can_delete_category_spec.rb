require 'rails_helper'

describe "When user clicks on a delete link" do
  it "will delete the individual category and redirect to the category index" do
    category = Category.create(title: "Fishing")
    start_count = Category.count
    visit categories_path

    click_link "Delete"

    expect(page).to have_content "#{category.title} was deleted!"
    expect(Category.count).to eq (start_count-1)
  end
end
