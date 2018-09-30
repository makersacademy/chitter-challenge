feature 'Message Board' do
  scenario 'User can post as themselves on the messageboard' do
    clean_database
    signup_navigation
    happy_signup
    happy_login
    fill_in 'message', with: "Test message"
    click_button("Post!")
    expect(page).to have_content("Test message")
  end
end
