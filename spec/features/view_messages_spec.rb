require 'user'
require 'message'

feature 'main screen' do
    it 'has register button' do
        visit('/')
        expect(page).to have_button "Register"
    end

    scenario 'see messages' do
        user = User.create(user_id: "bob", name: "Bob", email: "bob@bob.bob", password: "bob")
        message = Message.create(user_id: user.user_id, time: "2020-03-15 18:41:25+00", content: "Test message")

        visit('/')
        expect(page).to have_content "Test message"
        expect(page).to have_content "Bob"
        expect(page).to have_content "2020-03-15 18:41:25+00"
    end

end