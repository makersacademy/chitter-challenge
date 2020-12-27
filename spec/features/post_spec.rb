require 'pg'

feature 'post to board' do
  before(:each) do
    empty
    add_base_posts
  end
  scenario 'A user can post to the board' do
    # visit('/')
    visit('/logged_in')
    fill_in('post', with: "I'm learning to code!")
    click_button('Submit')
    expect(page).to have_content("I'm learning to code!")
    expect(page).to have_content('24.12.20')
  end
end
