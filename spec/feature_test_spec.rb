require 'spec_helper'
require 'time'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'using chitter' do

  time = Time.now.to_s
  peeptime = time[11..15]
  peepdate = time[8..9] + "-" + time[5..6] + "-" + time[2..3]

  scenario 'visiting the homepage' do
    visit '/'
    expect(page).to have_content "CHITTER"
    expect(page).to have_content "welcome to chitter"
  end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

  scenario 'being able to post a peep' do
    visit '/'
    fill_in('peep', with: "my first peep")
    click_button "POST"
    sleep(0.2)
    fill_in('peep', with: "my second peep")
    click_button "POST"

    expect(page).to have_content(
    "my second peep\n#{peeptime} #{peepdate} my first peep")
  end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

  scenario 'being able to see the time a post was made' do

    visit '/'
    fill_in('peep', with: "my first peep")
    click_button "POST"
    expect(page).to have_content peeptime
    expect(page).to have_content peepdate
  end
end
