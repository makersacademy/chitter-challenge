require './spec/spec_helper'

feature 'A user can post a message' do
  scenario 'A user posts and then sees the message' do
    visit '/'
    fill_in('message', with: 'first test')
    click_on 'Post'

    expect(page).to have_content('first test')

  end
end
