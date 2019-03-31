# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up' do
  scenario 'Users can sign up' do
    visit '/users/new'
    fill_in 'username', with: 'jblogg'
    fill_in 'name', with: 'Joe Bloggs'
    fill_in 'email', with: 'joe@bloggs.com'
    fill_in 'password', with: 'password123'
    click_button 'Create account'

    expect(page).to have_content("Welcome, jblogg")
  end
end
