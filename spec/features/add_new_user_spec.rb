feature 'add user' do
  scenario 'it adds a new user' do
    visit '/homepage'
    click_button 'Create account'

    fill_in 'name', with: 'name'
    fill_in 'username', with: 'user'
    fill_in 'email', with: 'user@user.com'
    fill_in 'password', with: 'password'
    click_button 'Submit'

    expect(page).to have_text("Welcome, user")
  end
end
