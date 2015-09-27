require './spec/factories/user'

feature 'signing up' do
  scenario 'can sign up with email, username, password and name' do
    user = build :user
    visit '/user/new'
    fill_in 'email', with: user.email
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    fill_in 'password_confirm', with: user.password_confirm
    fill_in 'name', with: user.name
    click_button 'Sign up'
    user = build :user
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button 'Log in'
    expect(page).to have_content "Hi, #{user.username}"
  end
end
