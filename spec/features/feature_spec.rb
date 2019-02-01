require 'pg'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
#
feature 'Adding peeps' do
  scenario 'A user can be prompted to add a peep' do
    visit('/')
    click_link('Add a peep')
    expect(page).to have_content "Please tell me your peep:"
  end

  scenario 'A user can add a peep' do
    visit('/')
    click_link('Add a peep')
    fill_in('comment', with: 'This is a test comment.')
    click_button('Post it!')
    expect(page).to have_content "This is a test comment."
  end
end


# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
#

feature 'Viewing peeps' do
  scenario 'A user can see peeps already written' do
    visit('/peeps')
    expect(page).to have_content "Here are the things"
  end
end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
#
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
#
# HARDER
#
# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter
#
# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter
#
# ADVANCED
#
# As a Maker
# So that I can stay constantly tapped in to the shouty box of Chitter
# I want to receive an email if I am tagged in a Peep
