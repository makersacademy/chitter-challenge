require 'spec_helper'
require_relative '../web-helper'

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Display Peeps in chronological order' do
  scenario 'I want to see all peeeps in chronological order' do
    sign_up
    log_in
    peep
    click_button 'Log out'
    new_sign_up
    log_in_2
    peep_2
    visit '/all_peeps'
    expect(page).to have_content("This is my first peep. And what a peep it is.")
    expect(page).to have_content("This is my second peep. And it's even better.")
  end
end
