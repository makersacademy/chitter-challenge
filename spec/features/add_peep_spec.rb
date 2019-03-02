feature 'adding a peep' do

  scenario 'logged-out, the new peep button is not available' do

    visit '/peeps'

    expect(page).to_not have_button 'Make a Peep'
    
  end

  scenario 'the new peep appears on the page and is attrubuted to the user who posted it' do

    sign_up_for_chitter
    
    log_in_to_chitter
    
    visit '/peeps'
    click_button 'Make a Peep'

    fill_in :text, with: 'Peep dis!'
    click_button 'Peep!'

    expect(page).to have_content 'Peep dis!'
    expect(page).to have_content 'Chitted by: testuser'
  end

end
