describe ChitterApp do
  feature 'Make a user account' do
    scenario 'User can make an account' do
      visit '/'
      click_button 'Create account'
      fill_in 'username', with: 'littletoast'
      fill_in 'email', with: 'littletoast@notadomain.com'
      fill_in 'password', with: 'password1'
      fill_in 'confirmpw', with: 'password1'
      click_button 'Submit'
      expect(page).to have_content('Hi, littletoast!')
    end
  end
end
