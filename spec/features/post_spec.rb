require 'pg'

feature 'post to board' do
  before(:each) do
    empty
    add_base_posts
  end
  scenario 'A user can post to the board' do
    visit('/')
    fill_in('posts', with: "I'm learning to code!")
    click_button('Submit')
    expect(page).to have_content("I'm learning to code!")
  end
end
