require 'peep'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'post peeps' do
  scenario 'user can connect to the page and see all peeps' do
    visit '/'
    expect(page).to have_content('Hello world!')
  end

  scenario 'user can add a peep' do
    visit '/'
    click_button 'Add a peep'
    fill_in 'Peep', with: "It's a new peep"
    click_button "Let's peep!"
    expect(page).to have_content("It's a new peep")
    expect(page).to have_content("Posted at: ")
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
#
# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
#
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
