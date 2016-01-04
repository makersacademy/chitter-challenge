# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'Allows user to sign out' do
  scenario 'User clicks log out, no longer signed in' do
    register_new_user
    click_button("Log Out")
    expect(page).not_to have_content("Signed in as: BTrain012")
    expect(page).to have_content("Not Signed In")
  end
  scenario 'User cannot post if not signed in' do
    visit '/'
    click_button("Continue without sign in")
    expect(page).not_to have_content("New Post")
    expect(page).to have_content("You must be signed in to post")
  end
  scenario 'Displays goodbye message on sign out' do
    register_new_user
    click_button("Log Out")
    expect(page).to have_content("See you soon, James Borrell!")
  end
end
