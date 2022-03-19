feature 'User can see all the peeps' do
  scenario 'can see peep' do
    visit '/peeps'
    expect(page).to have_content 'Peeps!'
    expect(page).to have_button 'Add Peep'
  end
end 