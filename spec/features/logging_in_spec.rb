require_relative '../web_helpers'

feature 'Logging in:' do
  include Helpers

  scenario 'A user can log in' do
    sign_up
    log_in
    expect(page).to have_content 'Hi, Yev Insomniak'
  end

  scenario "Can't log in with wrong password" do
    sign_up
    log_in_with_wrong_password
    expect(page).to have_content 'Wrong password. Please try again.'
  end
end