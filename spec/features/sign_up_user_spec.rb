# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'Sign Up' do
  scenario 'As a new user, I want to be able to sign up to Chitter' do
    visit('/')
    click_button('Sign Up')
    fill_in 'username', with: 'ayanit1'
    fill_in 'name', with: 'Albert'
    fill_in 'email_address', with: 'albert@hotmails.com'
    fill_in 'password', with: 'password'
    click_button 'Create Account'
    expect(page). to have_current_path('/peeps')
    # have a pop up message which confirms? Flash maybe
    expect(page). to have_content('Welcome, Albert')
  end
end
