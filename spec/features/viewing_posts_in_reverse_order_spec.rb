# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order
require 'byebug'

feature 'view peeps in reverse order' do
  scenario 'a user can see all peeps in reverse order' do

    Peep.create(content: "This is my first peep!")
    Peep.create(content: "This is my second peep!")
    Peep.create(content: "This is my third peep!")

    visit ('/peeps')

    expect(page).to have_content('This is my first peep!')
    expect(page).to have_content('This is my second peep!')
    expect(first(".peep")).to have_content('This is my third peep!')
  end
end 