# User story 2:
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Show all peeps' do
  scenario 'Show all peeps in reverse chronological order, with timestamps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data:

    connection.exec("INSERT INTO peeps (peep) VALUES('Hello world! First peep!')")
    connection.exec("INSERT INTO peeps (peep) VALUES('My second peep!')")
    connection.exec("INSERT INTO peeps (peep) VALUES('Third time lucky!')")

    visit '/peeps/'
    expect(page).to have_content 'Third time lucky!'
    expect(page).to have_content 'My second peep!'
    expect(page).to have_content 'Hello world! First peep!'

    # Installed the 'orderly' gem to test the order using appear_before:

    expect('My second peep!').to appear_before('Hello world! First peep!')
    expect('Third time lucky!').to appear_before('My second peep!')
  end
end
