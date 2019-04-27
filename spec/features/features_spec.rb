# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'posting a message' do
  scenario 'user posts a message on the page' do
    peep
    expect(page).to have_content 'Hello World'
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'seeing all peeps in reverse chronological order' do
  scenario 'visit posts page and seeing the last one at the top' do
    peep
    peep_2
    expect(page).to have_content 'World Hello Hello World'
  end
end
