require 'pg'

feature 'Sign up' do
  scenario 'Can sign up to post messages (peeps) on Chitter' do
    visit('/users/new')
    fill_in("name", with: "Maurice Bendrix")
    fill_in("username", with: "mauribendrix")
    fill_in("email", with: "mauribendrix@gmail.com")
    fill_in("password", with: "ilovesarah")
    click_button('Sign Up')
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario 'Email and username must be unique' do
    register_for_chitter
    visit('/users/new')
    fill_in("name", with: "Mauri Bendrix")
    fill_in("username", with: "mauribendrix")
    fill_in("email", with: "mauribendrix@gmail.com")
    fill_in("password", with: "iloveher!")
    click_button('Sign Up')
    sign_up_error_message = "The username and or email you entered are already in use"
    expect(page).to have_content sign_up_error_message
  end
end
