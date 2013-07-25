require 'spec_helper'

feature "Delete Movie" do
  scenario "remove movie" do
    movie = FactoryGirl.create(:movie, title: "Merlin Season 1")
    visit '/'
    click_link movie.title
    click_link "Remove Movie"
    page.should_not have_content(movie.title)
  end
end
