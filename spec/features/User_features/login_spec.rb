require 'web_helper'

feature 'login' do
  scenario 'a user can log in to chitter' do
    PG.connect(dbname: 'chitter_test')
    visit '/users/login'
    fill_in 'username', with: 'lovegoodluna'
    fill_in 'password', with: 'longbottomforever'
    click_button 'Login'
    
    expect(page).to have_content('Welcome to chitter lovegoodluna')
  end
end
