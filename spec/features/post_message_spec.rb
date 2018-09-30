feature 'post message' do
  scenario 'a user can post a message' do
    sign_in
    click_button('Post a message')
    fill_in('post', with: 'This is my first post')
    click_button('Post message')
    expect(page).to have_content "Welcome to Chitter, Test"
    expect(page).to have_content "This is my first post"
  end
end
