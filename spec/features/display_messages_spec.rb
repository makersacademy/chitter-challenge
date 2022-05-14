feature 'Displays messages' do
  scenario 'shows the messages' do
    Message.post('Message one, blah blah')
    Message.post('Message two, blah blah blah')
    
    visit('/messages')
    expect(page).to have_content "Message one, blah blah"
    expect(page).to have_content "Message two, blah blah blah"
  end
end