feature 'You can click on a button and go to the newsfeed' do
    scenario do
      visit '/peeps'
      expect(page).to have_content "This is the first peep"
    end
end
