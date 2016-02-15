require 'spec_helper'

feature 'User Sign In' do

  scenario 'There is a sign in option on Chitter\'s home page' do
    visit '/'
    expect(page).to have_content('Brother? Is that you?')
    expect(page).to have_button('Secret Member\'s Handshake')
  end

  scenario 'If user name is invalid a message is displayed' do
    visit '/'
    sign_up_good
    sign_in_bad_username
    expect(current_path).not_to be '/welcome'
    expect(page).to have_content('Brother, is that really you?')
  end

  scenario 'If credentials match you are welcomed' do
    visit '/'
    sign_up_good
    sign_in_good
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome to Chitter Brother Le Jockey')
  end

end
