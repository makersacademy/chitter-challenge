# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature "Sign up for chitter" do
  scenario "post messages as a user" do
    visit('/')
    click_button 'Sign Up for Chitter'
    fill_in 'email', with: 'test@testing.com'
    fill_in 'username', with: 'Joe Bloggs'
    fill_in 'password', with: 'pa$$word'
    click_button('Sign Up')
    expect(page).to have_content 'Welcome Joe Bloggs! A confirmation email has'\
    ' been sent to test@testing.com!'
  end
end
