require "spec_helper"

feature "Creating involvement" do
  before do
    @person = FactoryGirl.create(:person, 
        first_name: "Harrison",
        last_name: "Ford")
    @movie = FactoryGirl.create(:movie,
        title: "Fugitive")
    visit '/people'
    page.should have_content(@person.name)
  end
  scenario "create an involvement with valid info" do
    click_link @person.name
    page.should have_content(@person.name)  
    click_link "Add Movie or Role"
    page.should have_content("Add An Association")
    fill_in "Role", with: "Actor"
    page.select(@person.name, from: "involvement_person_id")
    page.select(@movie.title, from: "involvement_movie_id")
    click_button "Submit"
  end
end 
