feature 'You can click continue as guest and see the newsfeed' do
    scenario do
      visit '/'
      click_button 'Continue as guest'
      expect(page).to have_content 'Welcome guest'
    end
end

feature 'You can create an account and go to the registration page' do
    scenario do
      visit '/'
      click_button 'Continue as guest'
      click_button 'Create an account'
      expect(page).to have_content 'Register to create a Chitter account'
    end
end
