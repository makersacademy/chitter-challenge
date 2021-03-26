describe ChitterApp do
  feature 'Post a message' do
    scenario 'User can post a message and it is displayed on the page' do
      visit '/'
      fill_in 'message', with: 'My first peep!'
      click_button 'Peep'
      expect(page).to have_content('My first peep!')
    end
  end
end
