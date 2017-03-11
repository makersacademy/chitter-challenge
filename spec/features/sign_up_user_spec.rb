# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'Sign Up' do
  scenario 'As a new user, I want to be able to sign up to Chitter' do
    visit('/')
    click_button('sign up')
    expect(page.status_code).to eq 200
    fill_in 'username', with: 'ayanit1'
    fill_in 'email', with: 'albert@hotmails.com'
    fill_in 'password', with: 'password'
    click_button 'submit'
    expect(page). to have_current_path('/peeps')
    # have a pop up message which confirms
    expect(page). to have_content('Welcome, ayanit1')
  end
end
