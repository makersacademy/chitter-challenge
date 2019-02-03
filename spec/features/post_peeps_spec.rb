require 'peep'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'post peeps' do
  scenario 'user can connect to the page, see all peeps, and add some' do
    visit '/'
    expect(page).to have_content('First peep')
    expect(page).to have_content("Posted at: ")
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'peeps are in reverse chronological order' do
  scenario 'Second peep comes before first peep' do
    visit '/'
    expect('Second peep').to appear_before('First peep')
  end
end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
#
