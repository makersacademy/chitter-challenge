feature 'Posting a new peep' do
  scenario 'A user can post a peep to Chitter' do
    visit('/peeps')
    fill_in('content', with: 'Watching Adventure Time.')
    click_button 'Post'

    expect(page).to have_content 'Watching Adventure Time.'
  end
end