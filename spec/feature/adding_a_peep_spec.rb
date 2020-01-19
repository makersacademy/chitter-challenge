 feature 'adds a peep to the database' do  
  scenario 'Has a form and button so a user can add their peep' do 
    visit('/home')
    fill_in :peep, with: 'Hey, how it do?'
    click_button 'Make Peep'
    click_button "See All Peeps"
    expect(page).to have_content('Hey, how it do?')
  end 
end 