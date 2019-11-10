feature 'registration' do
  scenario 'users can sign up' do
      visit '/'
      fill_in :email, with: 'test@example.com'
      fill_in :password, with: 'password'
      fill_in :name, with: 'test123'
      fill_in :username, with: 'test'
      click_button 'Sign up'
      expect(page).to have_content 'Welcome, test123 to Chitter!'
  end

end
