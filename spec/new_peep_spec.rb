feature 'User creates a peep' do
  scenario 'User can enter a peep and see it on the peeps page' do
    visit '/peeps'
    fill_in 'peep', with: 'what I am thinking'
    click_button 'peep!'
    expect(page).to have_content 'what I am thinking'
  end
end
