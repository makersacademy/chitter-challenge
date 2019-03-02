feature 'adding a peep' do

  scenario 'logged-out, the new peep button is not available' do

    visit '/peeps'

    expect(page).to_not have_button 'Make a Peep'
    
  end

  scenario 'the new peep appears on the page' do
    
    visit '/peeps'
    click_button 'Make a Peep'

    fill_in :text, with: 'Peep dis!'
    click_button 'Peep!'

    expect(page).to have_content 'Peep dis!'
  end
end
