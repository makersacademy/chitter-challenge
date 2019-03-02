feature 'displays peeps' do
  scenario 'user can view peeps in reverse chronological order' do
    visit('/peeps')
    expect(page).to have_content "First test peep"
    expect(page).to have_content "Second test peep"
    expect(page).to have_content "Third test peep"
  end
end
