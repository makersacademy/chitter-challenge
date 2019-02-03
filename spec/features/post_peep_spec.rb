feature 'As a Maker' do
  scenario 'You can post a peep to Newsfeed' do
    visit '/peeps'
    fill_in 'peep', with: 'New peep'
    click_button 'Post'
    expect(page).to have_content 'New peep'
  end
end
feature 'As a Maker' do
    scenario 'You can see the time a peep was posted' do
      visit '/peeps'
      fill_in 'peep', with: 'New peep'
      click_button 'Post'
      expect(page).to have_content "New peep -- posted at #{DateTime.now}"
    end
  end
