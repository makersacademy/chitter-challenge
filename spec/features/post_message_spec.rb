# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Post a message' do
  scenario 'A user can post a message' do
    User.create(email: "test@example.com", password: "password123", username: "test_user")

    visit('/sessions/new')
    fill_in('email', with: "test@example.com")
    fill_in('password', with: "password123")
    click_button('Log in')
    
    fill_in('message', with: "Feature test peep")
    click_button('Post')
    expect(page).to have_content("Feature test peep")
  end
end
