# User story 2:
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Show all peeps' do
  scenario 'Show a list of all peeps in reverse chronological order' do
    visit '/peeps'
    expect(page).to have_content 'Third time lucky!'
    expect(page).to have_content 'My second peep!'
    expect(page).to have_content 'Hello world! First peep!'
    # I installed the 'orderly' gem so I could test using appear_before:
    expect('My second peep!').to appear_before('Hello world! First peep!')
    expect('Third time lucky!').to appear_before('My second peep!')
  end
end
