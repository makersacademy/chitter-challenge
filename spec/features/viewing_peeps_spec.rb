# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# As a maker
# So that I can see what others are saying
# I want to see all peeps

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do

    Peep.create(message: 'hello')

    visit('/peeps')
    expect(page).to have_content 'hello'
  end
end
