feature "User login" do
  scenario "existing user can log in to see a welcome message" do
    User.create(
      username: 'vannio',
      name: 'Van',
      email: 'van@email.com'
    )

    visit("/user/login")
    fill_in(:username, with: 'vannio')
    fill_in(:password, with: 'password')
    click_button(:"Log In")
    expect(page).to have_content("Welcome back, Van")
    expect(current_path).to eq("/")
  end

  scenario "non-existant user cannot log in" do
    visit("/user/login")
    fill_in(:username, with: 'vannio')
    fill_in(:password, with: 'password')
    click_button(:"Log In")
    expect(page).to_not have_content("Welcome back, Van")
    expect(current_path).to eq("/user/login")
  end
end
