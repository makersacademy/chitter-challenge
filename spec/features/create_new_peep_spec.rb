feature "Create new peep" do

  scenario "User can create a new peep and it is added to the list" do
    User.create(name: 'Jim', username: 'Jimmy',
      email: 'abc@123.com', password: 'abc123')

    visit "/"
    fill_in(:email, with: "abc@123.com")
    fill_in(:password, with: "abc123")
    click_button("Sign in")
    fill_in("peep_text", with: "A new peep")
    click_button("Submit")
    expect(page).to have_content("A new peep")
  end

  scenario "User cannot create a new peep if not logged in" do
    visit("/")
    expect(page).not_to have_button("Submit")
  end

end
