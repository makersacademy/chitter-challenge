# User story 4
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'User signup' do
  scenario 'user can sign up to chitter' do
    visit ('/')
    click_link 'Sign up'
    fill_in("name", with: "Dave")
    fill_in("username", with: "dave123")
    fill_in("email", with: "dave@hotmail.com")
    fill_in("password", with: "password")
    click_button 'Submit'
    expect(page).to have_content "Welcome to Chitter!"
  end

end
