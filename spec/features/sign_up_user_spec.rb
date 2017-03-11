# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
features 'Sign Up' do
  scenario 'As a new user, I want to be able to sign up to Chitter' do
    visit('/')
    click_button('sign up')
    # form being filled in
    # click submit
    # confirmation message maybe?
    # expect homepage to say user name
  end
end
