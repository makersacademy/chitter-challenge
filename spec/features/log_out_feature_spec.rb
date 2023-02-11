require_relative '../web_helpers.rb'

feature 'Log Out' do
  scenario 'user can log out from index' do
    add_user_and_log_in()
    click_on('Log Out')
    expect(page).to have_button('Log In')
    expect(page).to have_button('Sign Up')
  end
end