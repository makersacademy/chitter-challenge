feature 'Creating a user' do
  scenario 'user can sign up' do
    visit ('/')
    click_link 'Signup'
    fill_in("name", with: "Dave")
    fill_in("username", with: "dave123")
    fill_in("email", with: "dave@hotmail.com")
    fill_in("password", with: "password")
    click_button 'Submit'
    expect(page).to have_content "Welcome to Chitter, you have successfully signup!"
  end

end
