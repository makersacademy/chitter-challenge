feature 'Create new message' do

  let(:user) do
    User.create(name:                   'Example Name',
                username:               'example',
                email:                  'example@gmail.com',
                password:               'password',
                password_confirmation:  'password')
  end


  scenario 'when signed in, can access new message page from messages page' do
    sign_in(username: user.username,   password: user.password)
    click_button 'New Message'
    expect(page.status_code).to be 200
    expect(page).to have_content 'New Message Post'
  end

  scenario 'can post one new message' do
    expect{post_message(message: 'This is a test message')}.to change(Message, :count)
    expect(page).to have_content 'Example Name(example): This is a test message'
  end

  scenario 'multiple messages are posted in reverse chronological order' do
    post_message(message: 'This is a test message')
    post_message(message: 'This is a second test message')
    expect(page).to have_selector "ul#messages li:nth-child(2)",
      text: 'Example Name(example): This is a test message'
    expect(page).to have_selector "ul#messages li:nth-child(1)",
      text: 'Example Name(example): This is a second test message'
  end

  scenario 'message comes with time stamp' do
    post_message(message: 'This is a test message')
    time = Time.now.strftime("%H:%M, %d %b '%y")
    expect(page).to have_content "#{time}"
  end

  scenario 'can quit and return to seeing messages' do
    post_message(message: 'This is a test message')
    click_button 'Display Messages'
    expect(page).to have_content 'Messages'
  end

  scenario 'receive warning if try to create message and am not user' do
    visit '/users/new'
    click_button 'Display Messages'
    click_button 'New Message'
    expect(page).to have_content 'Must log in'
  end
end
