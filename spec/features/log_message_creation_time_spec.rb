feature 'Logs time of message creation' do
  scenario 'user is able to view the message creation time' do
    message = Message.create(message: "Hello Chitter")
    visit '/'
    expect(page).to have_content message.creation
  end
end
