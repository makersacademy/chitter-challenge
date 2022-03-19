feature 'User can see all the peeps' do
  scenario 'can see peep' do
    visit '/peeps'
    expect(page).to have_content 'Peeps!'
  end
end 