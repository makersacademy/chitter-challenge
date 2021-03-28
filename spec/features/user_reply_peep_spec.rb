describe ChitterApp do
  feature 'Post a message with a user pre tagged by reply' do
    scenario 'User can post a message with a pre tagged user' do
      DbConnection.query("TRUNCATE TABLE users, peeps, tags RESTART IDENTITY CASCADE;")
      User.new_user('littlecabbage', 'password1', 'littlecabbage@notadomain.com')
      visit '/'
      click_button 'Sign in'
      fill_in 'username', with: 'littlecabbage'
      fill_in 'password', with: 'password1'
      click_button 'Sign in'
      fill_in 'message', with: 'My first peep!'
      click_button 'Peep'
      expect(page).to have_content('My first peep!')
      click_button 'Sign out'
      User.new_user('littletrout', 'password1', 'littletrout@notadomain.com')
      visit '/'
      click_button 'Sign in'
      fill_in 'username', with: 'littletrout'
      fill_in 'password', with: 'password1'
      click_button 'Sign in'
      click_button 'Reply1'
      fill_in 'message', with: 'My first reply peep!'
      click_button 'Peep'
      expect(page).to have_content('My first reply peep!')
      expect(page).to have_content('peeped @ littlecabbage')
    end
  end
end
