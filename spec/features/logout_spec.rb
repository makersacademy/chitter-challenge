feature "Log out" do
  scenario "When a user clicks the log out button they are logged out" do
    User.create(email: 'fake1@fake.com', password: 'password')
    login
    click_button 'logout'
    expect(page). to have_content "Log in Email: Password:"
  end
end
