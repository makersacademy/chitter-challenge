feature 'post to board' do
  before(:each) do
    empty
    add_base_posts
  end
  scenario 'A user can post to the board' do
    visit('/')
    fill_in('user_1_post', with: "I'm learning to code!")
    click_button('Submit')
    expect(page).to have_text("I'm learning to code!")
  end
end
