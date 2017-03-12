# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'User sign in' do
  include Helpers

  scenario 'with correct credentials' do
    visit '/'
    sign_up
    click_button 'Sign Out'
    click_link 'Sign In'
    fill_in :username, with: 'tansaku'
    fill_in :password, with: 's3cr3t'
    click_button 'Submit'
    expect(page).to have_content 'Logged in as: tansaku'
  end
end
