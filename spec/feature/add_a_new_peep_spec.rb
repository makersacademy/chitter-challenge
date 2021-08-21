feature 'adds a new peep to the list of peeps' do
  scenario 'add a peep' do
    visit('/chitter')
    click_button('New Peep')
    fill_in('New Peep', with: 'Im a new peep')
    click_button('Share Peep')
    expect(page).to have_content('Im a new peep')
  end
end
