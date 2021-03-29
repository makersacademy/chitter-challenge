describe ChitterApp do
  feature 'Post a message' do
    scenario 'User can post a message and it is displayed on the page' do
      User.new_user('littletrout', 'password1', 'littletrout@notadomain.com')
      visit '/'
      click_button 'Sign in'
      fill_in 'username', with: 'littletrout'
      fill_in 'password', with: 'password1'
      click_button 'Sign in'
      fill_in 'message', with: 'My first peep!'
      click_button 'Peep'
      expect(page).to have_content('My first peep!')
    end
  end
end
