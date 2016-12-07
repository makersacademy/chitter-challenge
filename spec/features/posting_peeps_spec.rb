feature 'Posting a peep' do
  scenario 'I can post a peep if signed in' do
    sign_up
    log_in_post_peep
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content("My first peep")
    end
  end
  scenario 'I cannot post a peep if not signed in' do
    visit '/peeps/new'
    expect(page).to have_content("Please log in:")
  end
end
