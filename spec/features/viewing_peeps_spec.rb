feature 'Viewing Peeps' do 
    scenario 'visiting the index page' do 
        visit ('/')
        expect(page).to have_content "Chitter"
    end 
end 

feature 'Viewing peeps' do
    scenario 'A user can see bookmarks' do
      visit('/peepfeed')
  
      expect(page).to have_content "peep1"
      expect(page).to have_content "peep2"
      expect(page).to have_content "peep3"
    end
  end