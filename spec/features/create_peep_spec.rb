feature 'creating a peep' do
  scenario 'user visits peep page' do
    visit('/new-peep')
    expect(page).to have_content "Peep your thoughts."
  end
end
