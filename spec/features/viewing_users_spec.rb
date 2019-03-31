feature "Viewing users" do
  scenario "user can see list" do
    visit "/users"
    expect(page).to have_selector "ul"
  end

  scenario "user can see list of users" do
    # Add test data
    User.create(
      name: "Matt Tea",
      email: "matt@makers.io",
      password: "password1",
      username: "matttea"
    )
    
    visit "/users"
    expect(page).to have_content "Matt Tea"
  end
end
