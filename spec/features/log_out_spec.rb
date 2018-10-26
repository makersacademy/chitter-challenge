# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'Log out of Chitter' do

  scenario 'A user can log out' do
    register_user
    # fill_in :username, with: 'peeper1234'
    # fill_in :password, with: 'supersecretpassword'
    # click_button('Login')
     # p current_path
    expect(page).to have_content "Welcome to Chitter, peeper1234"

    click_link('Logout')
    # p "logout"
    # p current_path
    expect(page).not_to have_content "Welcome to Chitter, peeper1234"
    # expect(page).to have_content "You need to register"

  # (200 .. 399).should include(page.status_code)
  end
end
