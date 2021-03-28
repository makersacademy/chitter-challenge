describe ChitterApp do
  feature 'Post a message with a user tagged' do
    scenario 'User can post a message with a tagged user' do
      User.new_user('littletrout', 'password1', 'littletrout@notadomain.com')
      visit '/'
      click_button 'Sign in'
      fill_in 'username', with: 'littletrout'
      fill_in 'password', with: 'password1'
      click_button 'Sign in'
      fill_in 'message', with: 'My first peep!'
      fill_in 'tag', with: 'captainfrog'
      click_button 'Peep'
      expect(page).to have_content('My first peep!')
      expect(page).to have_content('peeped @ captainfrog')
    end
  end
end
