# STRAIGHT UP
#
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (blab) to blabber
feature 'posting messages' do
  scenario 'user posts a message' do
    post_first_blab
    expect(page).to have_content 'my first blab!'
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all blabs in reverse chronological order
feature 'viewing messages' do
  scenario 'user sees messages in reverse chronological order' do
    post_first_blab
    fill_in 'content', with: 'my second blab!'
    click_button 'blab'
    fill_in 'content', with: 'my third blab!'
    click_button 'blab'
    # regular expression to test if the beginning of the content consists of
    # a timestamp followed by the string "my third blab!"
    expect(page).to have_content(/^\d{4}-\d{2}-\d{2} \b\d{2}:\d{2}(my third blab!)/)
  end
end

# As a Maker
# So that I can better appreciate the context of a blab
# I want to see the time at which it was made
feature 'viewing timestamps' do
  scenario 'user can see timestamp of message' do
    post_first_blab
    # regular expression to look for a single 'word' consisting of two digits
    # between 0 and 2 followed by a colon, a digit between 0 and 5 and a digit
    # between 0 and 9
    expect(page).to have_content(/\b[0-2]\d:[0-5]\d/)
  end
end

# As a Maker
# So that I can post messages on Blabber as me
# I want to sign up for Blabber
feature 'registration' do
  scenario 'user can register for Blabber' do
    visit '/'
    click_button 'create an account'
    fill_in 'username', with: 'The Testman'
    fill_in 'name', with: 'Testee McTest'
    fill_in 'email', with: 'test@testmail.com'
    fill_in 'password', with: 'p@$$w0rd'
    click_button 'register'
    expect(page).to have_content 'Welcome, Testee McTest'
  end
end
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
