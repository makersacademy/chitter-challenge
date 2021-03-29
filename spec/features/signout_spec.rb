describe ChitterApp do
  feature 'Successfully signout' do
    scenario 'User can signout from the app' do
      User.new_user('littletrout', 'password1', 'littletrout@notadomain.com')
      visit '/'
      click_button 'Sign in'
      fill_in 'username', with: 'littletrout'
      fill_in 'password', with: 'password1'
      click_button 'Sign in'
      click_button 'Sign out'
      expect(page).not_to have_content('Hey, littletrout!')
      expect(page).to have_content('You have successfully signed out!')
    end
  end
end
