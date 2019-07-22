require "spec_helper"

feature 'Adding new posts to chitter' do
  scenario 'As a user, I want be able to add messages to Chitter' do
    visit('/posts')
    fill_in 'peep', with: ("This the content to my peep")
    fill_in 'user', with: ("TestUser")

    click_on("Post")
    expect(page).to have_content("This the content to my peep")
  end
end
