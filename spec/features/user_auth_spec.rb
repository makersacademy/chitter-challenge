feature 'Authentication:' do
  context 'Sign up' do
    scenario 'user signs up' do
      visit '/'
      expect(page).to have_content 'Chitter'
      fill_in :username, with: 'socks101'
      fill_in :email, with: 'socks@yahoo.com'
      fill_in :password, with: 'Topsecret'
      click_button 'Sign Up'
      expect(page).to have_content('Welcome socks101')
    end
  end

end
