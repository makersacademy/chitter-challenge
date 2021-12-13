feature "list of peeps" do
  scenario "user can see all peeps" do
    Peeps.add(peep: 'Just chilling...', time_of_peep: '12:11:30')
    Peeps.add(peep: 'Thoughts in progress...', time_of_peep: '15:32:01')

    visit '/peeps'
  
    expect(page).to have_content('Just chilling...')
    expect(page).to have_content('Thoughts in progress...')
  end
end
