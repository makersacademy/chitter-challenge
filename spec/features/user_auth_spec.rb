feature 'User Authentication' do
  context 'Signing up' do
    scenario 'A user can sign up' do
      visit '/'
      click_link 'Sign Up'
      fill_in :email, with: 'lol@makers.com'
      fill_in :password, with: 'funny123'
      fill_in :name, with: 'Joe King'
      fill_in :username, with: 'haha88'
      click_button 'Submit'

      expect(current_path).to eq '/profile'
      expect(page).to have_content 'Welcome, Joe King'
    end
  end
end
