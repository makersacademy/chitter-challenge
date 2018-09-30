describe 'Chitter Features' do
  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter
  feature 'Registration' do
    scenario 'The user signs up to the page' do
      visit '/'
      click_button('Sign up')
      expect(page.status_code).to eq(200)
      fill_in('name', with: 'testuser')
      fill_in('email', with: 'test@example.com')
      fill_in('password', with: 'testpw1')
      click_button('Submit')
      expect(page.status_code).to eq(200)
      expect(page).to have_content "Welcome, testuser"
    end
  end
end