feature 'Sign Out' do
  scenario 'a user can sign out' do
    User.create(name: "Test Name", username: "Test username",
      email: "test@test.com", password: "password123"
    )

    visit('/')
    click_button 'Sign In'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign In'
    click_button 'Sign Out'

    expect(page).not_to have_content 'Welcome, Test Name'
    expect(page).to have_content 'You have signed out.'
  end
end
