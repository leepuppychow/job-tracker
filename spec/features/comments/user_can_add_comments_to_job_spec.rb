require 'rails_helper'

describe "When user visits job show page" do
  it "can enter multiple comments for job in form at bottom of page" do
    job = create(:job)

    visit company_job_path(job.company, job)

    expect(page).to have_content "Add Comment"

    fill_in "comment[content]", with: "New comment for job"
    click_button "Create Comment"

    expect(page).to have_content "New comment for job"

    fill_in "comment[content]", with: "Yet another!"
    click_button "Create Comment"

    expect(page).to have_content "Yet another!"
    expect(current_path).to eq company_job_path(job.company, job)
  end
end
