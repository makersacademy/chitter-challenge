feature "Homepage" do

  scenario "show the index page for Chitter" do
    visit "/"
    expect(page).to have_content "Welcome to Chitter"
  end

end
