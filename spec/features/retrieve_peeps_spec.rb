feature 'Features - Retrieve peeps' do
  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order
  scenario 'user wants to see all peeps' do
    Peep.create(peep: 'my first peep, hurray!')
    Peep.create(peep: 'my second peep, hurray!')
    visit('/all_peeps')
    expect(page).to have_content('my first peep, hurray!')
    expect(page).to have_content('my second peep, hurray!')
  end

  scenario 'user wants to see when a peep was sent' do
    visit('/all_peeps')
    peep = Peep.create(peep: 'my first peep, hurray!')
    expect(page).to have_content('sent at')
  end
end
