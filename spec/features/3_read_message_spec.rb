require "message"

feature 'Feature: Message reading' do
  scenario 'anyone can view the messages' do
    user = User.create(name: "Elvis", email: 'test@example.com', password: 'password', receive_email: 'y')
    message1 = Message.create(sender: user.id,text: "Hello Tom")
    message1 = Message.create(sender: user.id,text: "Hello Mary")
    message1 = Message.create(sender: user.id,text: "Hello Jo")

    visit '/user'
    fill_in :name, with: 'Elvis'
    fill_in :password, with: 'password'
    click_button('submit')
    expect(page).to have_content 'Hello Tom'
    expect(page).to have_content 'Hello Mary'
    expect(page).to have_content 'Hello Jo'

  end

end
