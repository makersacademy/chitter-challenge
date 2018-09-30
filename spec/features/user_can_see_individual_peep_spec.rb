feature 'the user can go to a specific page to see a peep' do
  scenario 'when they know the id of the peep' do
    visit '/peeps/1'
    expect(page).to have_content 'Hello chitter'
    expect(page).to have_content 'Peeped by billy1'
  end
end
