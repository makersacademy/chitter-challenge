feature 'Posting a new peep' do
  scenario 'A user can post a peep to Chitter' do
    visit('/peeps/new')
    fill_in('content', with: 'Watching Adventure Time.')
    click_button 'Submit'

    expect(page).to have_content 'Watching Adventure Time.'
  end
end