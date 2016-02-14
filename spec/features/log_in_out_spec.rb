feature "Users can fill out a form to log in" do
  scenario "users are able to log in" do
    sign_up
    log_in
    expect(page).to have_content "Welcome to Chitter David"
  end

   scenario "users cannot log in is username and password don't match" do
    sign_up
    click_button('Log in')
    fill_in('username', with: 'drjparry')
    fill_in('password', with: 'wrong_password')
    click_button('Submit')
    expect(page).to have_content "The username and password do not match"
  end

end
