feature 'Displays messages' do
  scenario 'shows when the message was posted' do
    message = Message.post('Message one, blah blah')
    visit('/messages')

    expect(page).to have_content "Message one, blah blah"
    expect(page).to have_content(message.timestamp[0]['timestamp'])
  end

  scenario 'displays the author' do
    user = User.create('test@gmail.com', 'password123')
    visit '/sessions/new'
    fill_in :email, with: 'test@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Log in'

    Message.post('Message authored by me.', user.email )
    visit('/messages')

    expect(page).to have_content "By test@gmail.com"
    expect(page).to have_content 'Message authored by me.'
  end

  scenario 'displays annonymous if there is no author' do
    Message.post('Message posted by anonymous.')
    visit('/messages')

    expect(page).to have_content "By Anonymous"
    expect(page).to have_content 'Message posted by anonymous.'
  end
end


