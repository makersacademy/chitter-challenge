feature 'Authentication' do 
  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter
  scenario 'User able to sign up' do
    visit '/'
    expect(page).to have_content 'Chitter'
    fill_in :email, with: 'socks@yahoo.com'
    fill_in :password, with: 'Topsecret'
    click_button 'Sign Up'
    expect(page).to have_content('Welcome socks@yahoo.com')
  end
end
