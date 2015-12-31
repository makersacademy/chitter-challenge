feature 'Create new message' do

  let(:user) do
    User.create(name:                   'Example Name',
                username:               'example',
                email:                  'example@gmail.com',
                password:               'password',
                password_confirmation:  'password')
  end


  scenario 'can access new message page from messages page' do
    visit '/messages'
    click_button 'New Message'
    expect(page.status_code).to be 200
    expect(page).to have_content 'New Message Post'
  end

  scenario 'can post one new message' do
    sign_in(username: user.username,   password: user.password)
    click_button 'New Message'
    fill_in 'message', with: 'This is a test message'
    click_button 'Post'
    expect(page).to have_content 'example: This is a test message'
  end

  scenario 'can post two messages' do
    sign_in(username: user.username,   password: user.password)
    click_button 'New Message'
    fill_in 'message', with: 'This is a test message'
    click_button 'Post'
    click_button 'New Message'
    fill_in 'message', with: 'This is a second test message'
    click_button 'Post'
    expect(page).to have_content 'example: This is a test message'
    expect(page).to have_content 'example: This is a second test message'
  end

  def sign_in(username:               'example',
              password:               'password')
      visit '/users/new'
      fill_in 'existing_username', with: username
      fill_in 'existing_password', with: password
      click_button('Log in')
  end
end
