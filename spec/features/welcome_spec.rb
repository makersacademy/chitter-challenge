feature 'welcome page' do
  feature 'visiting the home page' do
    scenario ' the page title is visible' do
      visit '/'

      expect(page).to have_content 'Welcome to Chitter!'
      expect(page).to have_content 'Join us today'
    end
  end

  feature 'redirecting to sign up page' do
    scenario 'a user can click on sign up button' do
      visit '/'

      click_button('Sign up')

      expect(page).to have_content 'Please enter registration details'
    end
  end

  feature 'redirecting to sign in page' do
    scenario 'a user can click on sign in button' do
      visit '/'

      click_button('Sign in')

      expect(page).to have_content 'Please enter login details'
    end
  end
end