feature 'Register and Log in' do
  scenario 'User creates an account and logs in with their username and password' do
    visit('/')
    click_button("Register")
    fill_in "name", with: "Test"
    fill_in "username", with: "test"
    fill_in "email", with: "test@hotmail.co.uk"
    fill_in "password", with: "test123"
    click_button("Submit")
    expect(page).to have_content("Successfuly created account Test, log in to post peeps!")
    sign_in("test", "test123")
    expect(page).to have_content("test's Chitter feed")
    expect(page).not_to have_content("Your username or password was not recognised, try again")
  end
end
