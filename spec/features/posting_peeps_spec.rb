feature 'posting peeps' do
  scenario 'user can post a message to the website' do
    visit('/peeps')
    click_button 'Write a Peep'
    fill_in :message, with: 'My first peep'
    click_button 'Post Peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
    expect(page).to have_content 'My first peep'
    end
  end
end
