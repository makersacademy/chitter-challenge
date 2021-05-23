feature 'displaying the messages' do
  scenario 'it displays the content of the message' do
    Message.post('This is content')
    visit('/')
    expect(page).to have_css("p", text: "This is content")
  end
end
feature 'displaying the messages' do
  scenario 'it displays the time the message was posted' do
    Message.post('This is content')
    visit('/')
    expect(page).to have_content('2021')
  end
end
