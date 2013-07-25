require 'spec_helper'

feature "Editing Movies" do
  before do
    movie = FactoryGirl.create(:movie, title: "Toy Story")
    visit '/'
    click_link movie.title
    click_link "Edit Movie"
  end    
  
  scenario "can edit movies" do
    fill_in "Description", with: "Toys come to life and have adventures."
    click_button "Update Movie"
    page.should have_content("Movie has been updated.")
  end

  scenario "can not edit movie with invalid title" do
    fill_in "Title", with: ""
    click_button "Update Movie"
    page.should have_content("Movie has not been updated.")
  end
end
