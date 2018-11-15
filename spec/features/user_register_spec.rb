require 'user'
feature 'Sign up form' do
  scenario 'User can sign up on chitter page' do
    visit('/users/new')

    fill_in('name', with: 'Sam')
    fill_in('email', with: 'sam@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign up')

    expect(page).to have_content "Welcome, Sam"
  end
end
