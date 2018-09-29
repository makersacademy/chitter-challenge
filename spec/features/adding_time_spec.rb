# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'viewing time of peep' do
  scenario 'A user can see time of peep posted' do
    connection = PG.connect(dbname: 'chitter_test')
    # Add the test data
    now = DateTime.now
    Peep.create(peep: 'first peep', time: now.to_s)

    visit('/peeps')
    expect(page).to have_content now
  end
end