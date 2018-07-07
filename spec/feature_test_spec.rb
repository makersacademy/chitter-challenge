# STRAIGHT UP
#
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (blab) to blabber
feature 'posting a message' do
  scenario 'user posts a message' do
    visit '/'
    fill_in 'content', with: 'my first blab!'
    click_button 'blab'
    expect(page).to have_content 'my first blab!'
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all blabs in reverse chronological order
feature 'viewing blabs' do
  scenario 'user sees blabs in reverse chronological order' do
    visit '/'
    fill_in 'content', with: 'my first blab!'
    click_button 'blab'
    fill_in 'content', with: 'my second blab!'
    click_button 'blab'
    fill_in 'content', with: 'my third blab!'
    click_button 'blab'
    expect(page).to have_content "my third blab! my second blab! my first blab!"
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
