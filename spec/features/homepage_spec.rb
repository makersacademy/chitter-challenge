feature "Homepage" do
  scenario "welcomes user to Chitter" do
    visit "/"
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario "a user can choose to post a new peep" do
    visit "/peeps"
    click_button "Post a Peep"
    expect(page).to have_content "Add a peep"
  end
end