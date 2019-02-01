feature 'You can type a peep, press post and it will appear on the newsfeed' do
    scenario do
      visit '/peeps'
      fill_in 'peep', with: 'This is a new peep'
      click_button 'Post'
      expect(page).to have_content 'This is a new peep'
    end
end
