feature 'posting peeps' do
  scenario 'user can post a tweet' do
    sign_up
    post_peep("Ashton Kutcher 100% thinks the plural of journalist is 'journalist'")
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content("Ashton Kutcher 100% thinks the plural of journalist is 'journalist'")
    end
  end
    scenario 'user cannot post peep without signing in' do
      post_peep("Ashton Kutcher 100% thinks the plural of journalist is 'journalist'")
      within 'ul#peeps' do
        expect(page).not_to have_content("Ashton Kutcher 100% thinks the plural of journalist is 'journalist'")
      end
      expect(page).to have_content('Please sign in to peep')
    end
end
