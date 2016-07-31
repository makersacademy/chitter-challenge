require 'helpers/sign_up_helper'
require 'helpers/log_in_helper'

feature 'log in' do

  scenario 'an existing user logs into an existing account' do
    sign_up
    expect{log_in}.not_to change(User, :count)
    expect(current_path).to eq '/messages'
    expect(page).to have_content 'Welcome, Tim (TC86)'
  end

end
