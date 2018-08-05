feature 'authentication' do
  scenario 'a user can log in' do
    User.create(username: 'test3', name: 'test3', email: 'test3@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in("email", :with => 'test3@example.com')
    fill_in("password", :with => 'password123')
    click_button("Log in")
    expect(page).to have_content 'Welcome, test3'
  end
end
