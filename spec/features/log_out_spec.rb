# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'Log out of Chitter' do

  scenario 'A user can log out' do
    register_user
    expect(page).to have_content "Welcome to Chitter, peeper1234"

    click_link('Logout')
    expect(page).not_to have_content "Welcome to Chitter, peeper1234"
  end
end
