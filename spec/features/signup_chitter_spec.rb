require './app/app.rb'
require './app/models/user.rb'

feature 'Signing up to Chitter' do
  scenario 'User creates Chitter account with email and password' do
    visit '/signup'
    fill_in 'name', with: 'Liz'
    fill_in 'username', with: 'username'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'submit'
    expect(page).to have_content('Welcome, test@test.com')
  end

  scenario "User unable to sign up for Chitter if password and password confirmation do not match" do
    visit '/signup'
    fill_in 'name', with: 'Liz'
    fill_in 'username', with: 'username'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'badpassword'
    expect{(click_button 'submit')}.not_to change(User, :count)
  end

end
