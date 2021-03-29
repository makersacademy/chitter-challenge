describe ChitterApp do
  feature 'Unsuccessfully signin attempt' do
    scenario 'User incorrectly inputs their details and is notified' do
      User.new_user('littletrout', 'password1', 'littletrout@notadomain.com')

      visit '/'
      click_button 'Sign in'
      fill_in 'username', with: 'littletrouy'
      fill_in 'password', with: 'password1'
      click_button 'Sign in'
      expect(page).not_to have_content('Hey, littletrout!')
      expect(page).to have_content('Ensure you have correctly entered your username and password.')
    end
  end
end
