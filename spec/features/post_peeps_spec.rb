require 'peep'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'post peeps' do
  scenario 'user can connect to the page and see all peeps' do
    visit '/'
    expect(page).to have_content('Hello world!')
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
