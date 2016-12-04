feature 'Posting a peep' do
  scenario 'I can post a peep' do
    visit '/peeps/new'
    fill_in :message, with: 'My first peep'
    click_button 'Post peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content("My first peep")
    end
  end
end
