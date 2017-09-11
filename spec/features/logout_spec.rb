require 'web_helper'

feature 'Log out of Chitter' do

  scenario 'existing user can log out' do
    sign_up
    log_in
    click_button 'Log out'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content 'Welcome Cat_Peeps93!'
  end

end
