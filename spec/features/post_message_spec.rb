require_relative 'web_helper'

feature 'A user can post a message' do
  scenario 'A user posts and then sees the message' do
    visit '/'
    fill_in('message', with: 'first test')
    click_on 'Post'

    expect(page).to have_content('first test')

  end

  scenario 'A user can see all previous messages' do
    post_two_messages

    expect(page).to have_content('second test')
    expect(page).to have_content('third test')
  end

end
