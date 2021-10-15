
feature 'Adding a new peep' do
  scenario 'A user can add a new peep to Chitter' do
    visit('/chitter/new')
    fill_in('peep', with: '90% of coding is debugging. The other 10% is writing bugs.')
    click_button('Submit')

    expect(page).to have_content '90% of coding is debugging. The other 10% is writing bugs.'
  end
end