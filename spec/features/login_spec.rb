# User story 5
# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Log in' do
  scenario 'user logs into chitter using email and password' do
    visit ('/')
    click_link "Sign in"
    fill_in('email', with: 'dave@hotmail.com')
    fill_in('password', with: 'password')
    click_button 'Log in'
    expect(page).to have_content "Welcome to Chitter!"
  end
end