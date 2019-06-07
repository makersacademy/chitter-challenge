feature 'posting peeps' do
  scenario 'user can post a tweet' do
    sign_up
    post_peep("Chitty chitty bang bang we love you")
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content("Chitty chitty bang bang we love you")
    end
  end
    scenario 'user cannot post peep without signing in' do
      post_peep("Chitty chitty bang bang we love you")
      within 'ul#peeps' do
        expect(page).not_to have_content("Chitty chitty bang bang we love you")
      end
      expect(page).to have_content('Please sign in to peep')
    end
end
