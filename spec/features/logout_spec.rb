feature "Log out" do
  scenario "When a user uses the same password and email address as on their record they can sign in" do
    User.create(email: 'fake1@fake.com', password: 'password')
    visit '/'
    fill_in 'email', with: 'fake1@fake.com'
    fill_in 'password', with: 'password'
    click_button 'login'
    click_button 'logout'
    visit '/add'
    expect(page). to have_content "Please sign in"
  end
  end
