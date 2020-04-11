feature 'User can create a peep' do
  
  scenario 'User can enter a peep' do
    visit '/add'
    fill_in 'message', with: 'This is the first Peep!'
    click_button 'Peep'
    expect(page).to have_content 'This is the first Peep!'
  end

end