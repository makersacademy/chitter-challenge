feature 'posting a peep' do
  scenario 'a user visits the homepage and submits a message' do
    visit '/'
    click_button("Post Peep")
    expect(page).to have_content("What's on your mind?")
    fill_in "user", with: 'User'
    fill_in "user_handle", with: '@user'
    fill_in 'message', with: 'This is a test'
    click_button('Peep')
    expect(page).not_to have_content("Error")
    expect(page).to have_content('This is a test')
    expect(page).to have_content('by @user, User')
  end
end