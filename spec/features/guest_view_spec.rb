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

feature 'You can click on Sign in to return to the homepage' do
    scenario do
    visit '/'
    click_button 'Register'
    click_button 'Sign in'
    expect(page).to have_content 'Sign in to Chitter'
  end
end


feature 'You can click on Sign in to return to the homepage after being in guest view' do
    scenario do
    visit '/'
    click_button 'Continue as guest'
    click_button 'Create an account'
    click_button 'Sign in'
    expect(page).to have_content 'Sign in to Chitter'
  end
end
