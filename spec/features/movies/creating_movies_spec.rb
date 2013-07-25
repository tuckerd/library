require 'spec_helper'

feature "Adding movies" do
  scenario "can create movie with valid data" do
    visit '/'
    click_link "New Movie"
    fill_in "Title", with: "The West Wing Season 3"
    page.select("DVD", from: "movie_format")
    click_button "Create Movie"
    page.should have_content("Movie has been added to your library.")
    page.should have_content("The West Wing Season 3")
  end

  scenario "cannot create movie without a title or format" do
    visit '/'
    click_link "New Movie"
    click_button "Create Movie"
    page.should have_content("Movie has not been added to your library.")
    page.should have_content("Title can't be blank")
  end
end
