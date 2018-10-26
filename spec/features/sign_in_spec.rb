feature 'Sign In' do
  scenario 'a user can sign in' do
    User.create(name: "Test Name", username: "Test username",
      email: "test@test.come", password: "password123"
    )

    visit('/')
    click_button 'Sign In'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign In'

    expect(page).to have_content "Welcome, Test Name"
  end
end
