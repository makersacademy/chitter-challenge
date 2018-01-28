# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'User sign out' do
  scenario 'while signed in' do
    create_test_user
    sign_in
    click_button 'Sign out'
    expect(page).not_to have_content "Logged in as mr_ed"
    expect(page).to have_content "Goodbye!"
  end
end
