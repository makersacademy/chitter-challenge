require 'sign_up_helper'

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'View peeps' do
  scenario 'The user can view all peeps in reverse chronological order' do
    sign_up 'Paul Martin', 'Hivemind', 'me@hotmail.com', 'password'

    visit '/'
    peeps = [
      "First peep w00t!!",
      "Second peep w00t!!!",
      "Third peep w00tles!!?!?!"
    ]

    peeps.each do |peep|
      fill_in 'peep_content', with: peep
      click_button 'Peep'
    end

    expect(peeps[2]).to appear_before peeps[1] 
    expect(peeps[1]).to appear_before peeps[0] 
  end
end
