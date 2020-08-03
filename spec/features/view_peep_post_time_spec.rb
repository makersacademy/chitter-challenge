feature 'Peeps are sorted in reverse chronological order' do
  scenario 'User will see most recent peeps at the top of the page' do
    Peep.create(content: 'Test peep 2', time: '2020-08-01 12:00:00')
    visit '/peeps'
    expect(page).to have_content('2020-08-01 12:00:00')
  end
end
