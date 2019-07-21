# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'posting a peep' do
  scenario 'check site is working first' do
    visit('/')
    expect(page).to have_content "Hello, world!"
  end
  scenario 'user can go to /create and add a peep to the db' do
    visit('/')
    click_button 'create'
    expect(page).to have_content "Please enter your message below"
    fill_in 'body', with: 'a sample peep'
    click_button 'submit'
    click_button 'view_peeps'
    expect(page).to have_content "a sample peep"
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
feature 'viewing a peep' do
  scenario 'when viewing peeps they should display in reverse chronological order' do
    visit('/')
    click_button 'view_peeps'
    expect(page).to have_content "newest post"
    expect(page).to have_content "second newest post"
    expect(page).to have_content "third newest post"
  end
end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

# As a Maker
# So that I can stay constantly tapped in to the shouty box of Chitter
# I want to receive an email if I am tagged in a Peep
