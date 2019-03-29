require_relative 'web_helper'

feature 'A user can post a message' do
  scenario 'A user posts and then sees the message' do
    post_a_message

    expect(page).to have_content('first test')
  end

  scenario 'A user can see all previous messages' do
    post_two_messages

    expect(page).to have_content('second test')
    expect(page).to have_content('third test')
  end

  scenario 'A User can see who posted a message on the home page' do
    post_a_message
    visit('/')
    expect(page).to have_content('The Crimson King')
  end

  scenario 'A User can see who posted a message on their profile page' do
    post_a_message
    expect(page).to have_content(': | The Crimson King')
  end

end
