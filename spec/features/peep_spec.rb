feature 'Creating a Peep' do
  scenario 'User creates new Peep' do
    new_peep
    expect(page).to have_content('Test peep')
  end

  scenario 'User cancels new Peep' do
    cancelled_peep
    expect(page).to_not have_content('Test peep')
  end
end
