# I can post messages on Chitter as me

feature 'post message as me' do
  scenario 'a user can post message as themselves' do
    User.create(email: "test@example.com", password: "password123", username: "test_user")

    visit('/sessions/new')
    fill_in('email', with: "test@example.com")
    fill_in('password', with: "password123")
    click_button('Log in')

    fill_in('message', with: "Feature test peep as me")
    click_button('Post')
    expect(page).to have_content("Posted by: test_user")
  end
end
