require 'spec_helper'

feature 'A user logs out' do
  scenario 'The user clicks the "Log out" button' do
    sign_up
    log_in
    log_out
    expect(page).to have_content('Goodbye.')
  end
end
