# User story 2:
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# User story 3:
# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Show all peeps' do
  scenario 'Show all peeps in reverse chronological order, with timestamps' do

    # Add the test data:

    first_peep = Peep.new_peep('Hello world! First peep!')
    second_peep = Peep.new_peep('My second peep!')
    third_peep = Peep.new_peep('Third time lucky!')

    visit '/peeps/'
    expect(page).to have_content 'Third time lucky!'
    expect(page).to have_content third_peep.timestamp
    expect(page).to have_content 'My second peep!'
    expect(page).to have_content second_peep.timestamp
    expect(page).to have_content 'Hello world! First peep!'
    expect(page).to have_content first_peep.timestamp

    # Installed the 'orderly' gem to test the order using appear_before:

    expect('My second peep!').to appear_before('Hello world! First peep!')
    expect('Third time lucky!').to appear_before('My second peep!')
  end
end
