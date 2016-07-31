require_relative '../web_helper.rb'

feature 'User signs out' do

  scenario 'while being signed in' do
    sign_up
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Hello, JoeBloggs93')
  end

end
