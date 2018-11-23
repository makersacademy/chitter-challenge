require 'spec_helper.rb'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Post message (peep) to Chitter' do
  scenario 'allows to post a message' do
    vist_and_signup
    expect(page).to have_content "Enter your message"
  end
end
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
feature 'Display peeps' do
  scenario 'in reverse chronological order' do
    vist_and_signup
    fill_in :content, with: 'My first message'
    click_button 'Submit'
    fill_in :content, with: 'My second message'
    click_button 'Submit'
    expect(page.find('li:nth-child(1)')).to have_content('My first message')
    expect(page.find('li:nth-child(2)')).to have_content('My second message')
  end

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made
  scenario 'with time at which it was made' do
    vist_and_signup
    fill_in :content, with: 'My first message'
    time = Time.now.strftime('%F %H:%M:%S')
    click_button 'Submit'
    expect(page).to have_content('My first message')
    expect(page).to have_content(time)
  end
end

  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter
feature 'Registration' do
  scenario 'a user can sign up' do
    vist_and_signup

    expect(page).to have_content "Welcome, Aga"
    expect(page).to have_content "Enter your message"
  end
end
