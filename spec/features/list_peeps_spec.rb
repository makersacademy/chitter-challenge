feature "list of peeps" do
  scenario "user can see all peeps" do
    Peeps.add(peep: 'Just chilling...')
    Peeps.add(peep: 'Thoughts in progress...')

    visit '/peeps'
  
    expect(page).to have_content('Just chilling...')
    expect(page).to have_content('Thoughts in progress...')
  end
end
