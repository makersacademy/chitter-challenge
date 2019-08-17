feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'test@email.com', username: 'testusername', name: 'Test Name', password: 'Test Password')
    visit ('/sessions/new')
    fill_in(:email, with:'test@email.com')
    fill_in(:password, with: 'Test Password')
    click_button('Sign In')

    expect(page).to have_content 'Welcome, test@email.com'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: 'password123', username: 'testusername', name: 'Test Name')
    visit ('/sessions/new')
    fill_in(:email, with:'wrongemail@email.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')

    expect(page).not_to have_content 'Welcome, wrongemail@email.com'
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user sees an error if they try to log in with the wrong password' do
    User.create(email: 'test@example.com', password: 'password123', username: 'testusername', name: 'Test Name')
    visit ('/sessions/new')
    fill_in(:email, with:'test@example.com')
    fill_in(:password, with: 'wrongpassword123')
    click_button('Sign In')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password'
  end 

end
