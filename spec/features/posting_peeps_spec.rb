feature 'posting peeps' do
  scenario 'user can post a tweet' do
    post_peep("Ashton Kutcher 100% thinks the plural of journalist is 'journalist'")
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content("Ashton Kutcher 100% thinks the plural of journalist is 'journalist'")
    end
  end
end
