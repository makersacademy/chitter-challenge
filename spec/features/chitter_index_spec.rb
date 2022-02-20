feature "Homepage" do

  scenario "show the index page for Chitter" do
    visit "/"
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario "a user can decide to post a new peep" do
    visit "/peeps"
    click_button "Post Peep"
    expect(page).to have_content "Create a peep"
  end
  
end
