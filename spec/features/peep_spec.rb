feature 'Posting peeps' do
  scenario 'I can post a message (peep) to Chitter' do
    visit '/home'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
    expect(page).to have_content('This is a peep')
  end
end
