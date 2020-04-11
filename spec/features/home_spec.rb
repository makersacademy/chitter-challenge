feature 'User can create a peep' do
  
  scenario 'User can enter a peep' do
    visit '/add'
    fill_in 'message', with: 'This is the first Peep!'
    click_button 'Peep'
    expect(page).to have_content 'This is the first Peep!'
  end

  scenario 'User can enter a peep' do
    peep_1 = Peep.create("Peep 1", '2020-04-09 10:52:57.960784')
    peep_2 = Peep.create("Peep 2", '2020-04-10 10:52:57.960784')
    visit '/add'
    fill_in 'message', with: 'This is the Newest Peep!'
    click_button 'Peep'
    expect(page).to have_content 'This is the Newest Peep! Peep 2 Peep 1'
  end

end