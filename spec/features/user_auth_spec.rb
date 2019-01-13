feature 'User Authentication' do
  context 'Signing up' do
    scenario 'A user can sign up' do
      sign_up

      expect(current_path).to eq '/profile'
      expect(page).to have_content 'Welcome, Joe King'
      expect(page).to have_content 'Email: lol@makers.com'
      expect(page).to have_content 'Username: haha88'
    end

    scenario 'A user cannot sign up with an email or username that already exists' do
      sign_up
      sign_up

      expect(current_path).to eq '/signup'
      expect(page).to have_content 'Error: email or username already exists'
    end
  end

  context 'Signing in/out' do
    scenario 'A user can sign out' do
      sign_up
      click_button 'Sign Out'
      click_link 'Profile'

      expect(current_path).to eq '/'
      expect(page).to have_content 'You are not signed in'
    end

    scenario 'A user can sign in' do
      sign_up
      click_button 'Sign Out'
      sign_in

      expect(current_path).to eq '/profile'
      expect(page).to have_content 'Welcome, Joe King'
      expect(page).to have_content 'Email: lol@makers.com'
      expect(page).to have_content 'Username: haha88'
    end
  end
end
