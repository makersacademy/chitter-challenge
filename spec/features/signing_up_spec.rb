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
      fill_in('mail', with: 'test@example.com')
      fill_in('password', with: 'testpw1')
      click_button('Submit')
      expect(page.status_code).to eq(200)
      expect(page).to have_content "Welcome, testuser"
    end
    scenario 'The user does not provide a valid email address' do
      visit 'users/new'
      expect(page.status_code).to eq(200)
      fill_in('name', with: 'testuser')
      fill_in('mail', with: 'example.com')
      fill_in('password', with: 'testpw1')
      click_button('Submit')
      expect(page.status_code).to eq(200)
      expect(page).to have_content "Please enter a valid email address."
    end
    scenario 'The user does not provide name' do
      visit 'users/new'
      fill_in('mail', with: 'test@example.com')
      fill_in('password', with: 'testpw1')
      click_button('Submit')
      expect(page).to have_content "Please enter your username."
    end
    scenario 'The user does not provide a password' do
      visit 'users/new'
      fill_in('name', with: 'testuser')
      fill_in('mail', with: 'test@example.com')
      click_button('Submit')
      expect(page).to have_content "Please enter a password."
    end
  end
end
