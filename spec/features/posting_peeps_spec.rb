feature 'posting peeps' do
  scenario 'existing peeps are displayed on homepage' do
    Peep.create(post: 'Peeping all over chitter')
    visit('/peeps')
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Peeping all over chitter')
    end
  end
  scenario 'user can post a tweet' do
    visit 'peeps/new'
    fill_in 'post', with: "Ashton Kutcher 100% thinks the plural of journalist is 'journalist'"
    click_button 'Post Peep!'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content("Ashton Kutcher 100% thinks the plural of journalist is 'journalist'")
    end
  end
end
