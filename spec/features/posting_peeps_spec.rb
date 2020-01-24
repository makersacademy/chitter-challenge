feature 'Posting a peep' do
    scenario 'User can post a peep' do
      visit '/'
      fill_in :peep, with: 'This is my first peep!'
      click_button 'Post'
      expect(page).to have_content('This is my first peep!')
    end
  end