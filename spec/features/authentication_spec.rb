describe 'Chitter Features' do
  feature 'authentication' do
    it 'a user can sign in' do
      User.create(name: 'testuser', email: 'test@example.com', password: 'testpw1')
      visit '/login'
      expect(page.status_code).to eq(200)
      fill_in(:email, with: 'test@example.com')
      fill_in(:password, with: 'testpw1')
      click_button('Sign in')

      expect(page).to have_content 'Welcome, testuser'
    end
    scenario 'a user sees an error if they get their email wrong' do
      User.create(name: 'testuser', email: 'test@example.com', password: 'testpw1')

      visit '/login'
      expect(page.status_code).to eq(200)
      fill_in(:email, with: 'wrong@example.com')
      fill_in(:password, with: 'testpw1')
      click_button('Sign in')

      expect(page).not_to have_content 'Welcome, testuser'
      expect(page).to have_content 'Please check your email or password.'
    end
  end
end
