feature 'post to board' do
  scenario 'A user can post to the board' do
    visit('/')
    fill_in('user_1_post', with: "I'm learning to code!")
    click_button('Submit')
    expect(page).to have_text("I'm learning to code!")
    # expect(page).to have_text("hello.com")
  end
end
