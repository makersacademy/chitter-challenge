feature 'homepage' do
  scenario 'will let me post a peep' do
    visit '/chitter'
    expect(page).to have_content 'Chitter Post a peep:'
    expect(page).to have_button 'Peep'
  end
end
