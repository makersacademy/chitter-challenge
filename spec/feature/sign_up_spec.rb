# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up to Chitter' do
  scenario 'show a sign-up form' do
    visit('/')
    click_button 'sign_up'
    fill_in 'user', with: 'Tester'
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'PASSWORD'
    click_button 'register'
    expect(page).to have_content 'Logged in as: Tester'

  end

end
