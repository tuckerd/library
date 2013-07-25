require "spec_helper"

feature "Creating people" do
  scenario "create a persion with valid info" do
    visit '/people'
    click_link 'New Person'
    fill_in "First Name", with: "Sam"
    fill_in "Last Name", with: "Neill"
    fill_in "Bio", with: "http://www.imdb.com/name/nm0000554/bio"
    click_button "Create Person"
    page.should have_content("Person has been added.")
    page.should have_content("Sam")
  end
end 
