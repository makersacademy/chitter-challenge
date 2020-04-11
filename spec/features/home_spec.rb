feature 'User can create a peep' do
  
  scenario 'User can enter a peep' do
    visit '/add'
    fill_in 'message', with: 'This is the first Peep!'
    click_button 'Peep'
    expect(page).to have_content 'This is the first Peep!'
  end

  scenario 'User can enter a peep' do
    peep_1 = Peep.create("Peep 1")
    peep_2 = Peep.create("Peep 2")
    visit '/add'
    fill_in 'message', with: 'This is the Newest Peep!'
    click_button 'Peep'
    expect(page).to have_content 'This is the Newest Peep! Peep 2 Peep 1'
  end

end