# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order
feature 'Viewing peeps' do
  scenario 'A user can see peeps reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    Peep.create(peep: 'first peep', time: DateTime.now)
    Peep.create(peep: 'second peep', time: DateTime.now)
    Peep.create(peep: 'third peep', time: DateTime.now)

    visit('/peeps')

    expect(page).to have_content "first peep"
    expect(page).to have_content "second peep"
    expect(page).to have_content "third peep"

  end
end