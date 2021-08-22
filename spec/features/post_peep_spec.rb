feature 'posting new peep' do
  scenario 'allows user to create a new peep' do
    visit '/' 
    fill_in :peep, with: 'just setting up my twttr'
    expect(page).to have_selector(:link_or_button, 'Peep')
  end
end
