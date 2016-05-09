feature 'Creating peeps' do
  scenario 'I can create a new peep' do
    visit '/new'
    fill_in 'peep',   with: 'peep'
    click_button 'Create peep'
    expect(page).to have_content('peep')
  end
end