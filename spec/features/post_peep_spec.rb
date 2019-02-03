feature 'You can type a peep, press post and it will appear on the newsfeed' do
    scenario do
      register
      fill_in 'peep', with: 'This is a new peep'
      click_button 'Post'
      expect(page).to have_content 'This is a new peep'
    end
end

feature 'You can see the time a peep was posted' do
    scenario do
      register
      fill_in 'peep', with: 'This is a new peep'
      click_button 'Post'
      expect(page).to have_content "This is a new peep (#{DateTime.now})"
    end
  end

feature 'You can see the time a peep was posted' do
    scenario do
      register
      fill_in 'peep', with: 'This is a new peep'
      click_button 'Post'
      expect(page).to have_content "user name says: This is a new peep (#{DateTime.now})"
    end
  end
