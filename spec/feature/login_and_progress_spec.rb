require 'sinatra'
require 'pg'

feature 'Homepage' do
  scenario 'We should be able to log in with credentials' do
    visit '/'
    fill_in 'uname', with: 'nwmbutler'
    fill_in 'psw', with: '1234'
    click_button 'Login'
    expect(page).to have_content("Chitters")
  end
end
