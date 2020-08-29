feature 'registration' do
  scenario 'a user can sign up for chitter' do
    visit '/users/new'
    fill_in 'username', with: 'tester'
    fill_in 'email', with: 'test@testing.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign Up'

    expect(page).to have_content "Welcome tester"
  end
end
