# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter




feature "Users can fill out a form to log in" do
  scenario "users are able to log in" do
    sign_up
    log_in
    expect(page).to have_content "Welcome, David"
  end

   scenario "users cannot log in is username and password don't match" do
    sign_up
    click_button('Log in')
    fill_in('username', with: 'drjparry')
    fill_in('password', with: 'wrong_password')
    click_button('Submit')
    expect(page).to have_content "The username and password do not match"
  end

  scenario "users are able to log out after logging in" do
    sign_up
    log_in
    click_button('Log out')
    expect(page).not_to have_content "Welcome to Chitter David"
    expect(page).to have_content "Goodbye!"
  end

end
