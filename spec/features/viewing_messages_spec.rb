feature "viewing messages" do
  
  scenario "a user can see all messages" do

    # Add the test data
    user = User.sign_up(email: "test@mail.com", password: "password")
    Message.create(msg: "hello world", user_id: user.id)
    Message.create(msg: "i love kimchi", user_id: user.id)
    Message.create(msg: "donuts, amirite?", user_id: user.id)

    visit '/messages'

    expect(page).to have_content("hello world")
  end
end
