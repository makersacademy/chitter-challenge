feature 'User can create a new peep' do
  scenario 'User creates a peep' do
    sign_up
    click_button 'Peep!'
    fill_in :body, with: 'My first peep!'
    click_button 'Peep it!'
    expect(page).to have_content 'My first peep'
    expect(page).to have_content 'Peeped by: alias'
  end
end
