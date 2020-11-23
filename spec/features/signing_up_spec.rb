require 'pg'

feature 'Signing up' do
  scenario 'a user can create an account' do
    visit '/'
    click_button 'Sign up'
    fill_in :name, with: 'Hyko'
    fill_in :username, with: 'hykothehusky'
    fill_in :email, with: 'hyko@hyko.com'
    fill_in :password, with: 'squirrels'
    click_button 'Sign up'
    expect(page).to have_content('Welcome to Chitter!')
  end
end
