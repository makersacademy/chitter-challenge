feature 'Creating new peep' do

  scenario 'user can add a new peep' do
    visit("/")
    click_link('All Peeps')
    click_link('Add a new Peep')
    fill_in('Author1', with: 'Lin')
    fill_in('Handle1', with: '@LinnyCoder')
    fill_in('Content1', with: 'Oh cool! I can add a new peep too!')
    click_button('Submit a new peep')
    expect(page).to have_content('Oh cool! I can add a new peep too!')
  end
end