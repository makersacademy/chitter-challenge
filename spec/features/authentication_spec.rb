describe 'Chitter Features' do
  feature 'authentication' do
    it 'a user can sign in' do
      User.create(name: 'testuser', email: 'test@example.com', password: 'testpw1')
      # Then sign in as them
      visit '/login'
      expect(page.status_code).to eq(200)
      fill_in(:email, with: 'test@example.com')
      fill_in(:password, with: 'testpw1')
      click_button('Sign in')

      expect(page).to have_content 'Welcome, testuser'
    end
  end
end
