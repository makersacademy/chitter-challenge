feature 'You can click comment and arrive at a page to write a comment' do
    scenario do
      register
      fill_in 'peep', with: 'This is a new peep'
      click_button 'Peep'
      click_button "Comment on user name's peep"
      expect(page).to have_content 'Add comment'
    end
end

feature 'You can comment on a peep' do
    scenario do
      register
      fill_in 'peep', with: 'This is a new peep'
      click_button 'Peep'
      click_button "Comment on user name's peep"
      fill_in 'comment', with: 'New comment'
      click_button 'Comment on peep'
      expect(page).to have_content 'user name commented: New comment'
    end
end
