feature "Log out" do
  scenario "When a user uses the same password and email address as on their record they can sign in" do
    User.create(email: 'fake1@fake.com', password: 'password')
    login
    click_button 'logout'
    expect(page). to have_content "Log in Email: Password:"
  end
end
