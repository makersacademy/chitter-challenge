require_relative '../web_helpers'

feature 'Logging out:' do
  include Helpers

  scenario 'User logs out' do
    sign_up
    log_in
    log_out
    expect(page).to have_content 'Goodbye, Yev Insomniak'
    expect(page).not_to have_content 'Welcome, Yev Insomniak'
  end
end