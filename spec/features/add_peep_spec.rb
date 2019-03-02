feature 'adding a peep' do
  scenario 'the new peep appears on the page' do
    
    visit '/peeps'
    click_button 'Make a Peep'

    fill_in :text, with: 'Peep dis!'
    click_button 'Peep!'

    expect(page).to have_content 'Peep dis!'
  end
end
