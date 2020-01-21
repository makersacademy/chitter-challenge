feature 'Viewing bookmarks' do
    scenario 'A user can see bookmarks' do
      visit('/peeps')
  
      expect(page).to have_content "peep 1"
      expect(page).to have_content "peep 2"
    end
  end