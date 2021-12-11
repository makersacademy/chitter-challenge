feature 'Viewing index' do
    scenario 'visiting the index page' do
      visit('/')
      expect(page).to have_content "Welcome to Chitter!"
      expect(page).to have_button 'View Peeps'
      expect(page).to have_button 'Post a Peep'
    end
  end