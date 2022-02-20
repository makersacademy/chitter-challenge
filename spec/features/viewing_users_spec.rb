feature "Viewing users" do

  scenario "user can see list on the user page" do
    visit "/users"
    expect(page).to have_selector "ul"
  end

  scenario "user can see list of all the other Chitter users" do
    # Add test data
    User.create(
      name: "Claire Nelson",
      username: "cnelson",
      email: "claire@makersacademy.com",
      password: "password1"
    )
    visit "/users"
    expect(page).to have_content "Claire Nelson"
  end

end
