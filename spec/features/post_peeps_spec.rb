require 'peep'
require 'helper'

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
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'users can sign up for Chitter' do
  scenario 'user clicks the sign up button and enters their details' do
    visit '/'
    click_button 'Sign up'
    fill_in 'firstname', with: 'Alan'
    fill_in 'surname', with: 'Smith'
    fill_in 'email', with: 'alan.smith@makers-test.com'
    fill_in 'password', with: 'Password1'
    click_button 'Confirm'
    expect(page).to have_content "You've signed up successfully to Chitter... Welcome!"
    expect(page).to have_button "Go back to the Chitter feed"
  end
end
