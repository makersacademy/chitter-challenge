require './app/app.rb'
require './app/models/user.rb'

feature 'Signing up to Chitter' do
  scenario 'User creates Chitter account with email and password' do
    visit '/signup'
    fill_in 'username', with: 'username'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    click_button 'submit'
    # expect(page).to have_content('Welcome to Chitter test@test.com')
    expect(page).to have_content('Welcome to Chitter')

  end
end
