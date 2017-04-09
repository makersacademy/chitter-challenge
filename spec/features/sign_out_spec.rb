require 'helpers/session'

feature 'Sign out' do

  before(:each) do
    User.create(email: 'dory@underthesea.com',
    password: 'marvin',
    name: 'Dory',
    username: 'keepswimming')
  end

  scenario 'when signed in' do
    sign_in(email: 'dory@underthesea.com', password: 'marvin')
    click_button 'Sign out'
    expect(page).to have_content('Logged out')
    expect(page).to_not have_content('Welcome dory@underthesea.com')
  end

end
