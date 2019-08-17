require_relative '../web_helpers'

feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'test@email.com', username: 'testusername', name: 'Test Name', password: 'Test Password')
    signin

    expect(page).to have_content 'Welcome, testusername'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: 'password123', username: 'testusername', name: 'Test Name')
    visit '/sessions/new'
    fill_in(:email, with: 'wrongemail@email.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')

    expect(page).not_to have_content 'Welcome, wrongemail@email.com'
    expect(page).not_to have_content 'Welcome, testusername'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user sees an error if they try to log in with the wrong password' do
    User.create(email: 'test@example.com', password: 'password123', username: 'testusername', name: 'Test Name')
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword123')
    click_button('Sign In')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user can sign out' do
    User.create(email: 'test@email.com', username: 'testusername', name: 'Test Name', password: 'Test Password')
    signin
    click_button('Sign Out')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'See you soon.'
  end

  scenario 'a user tries to signup with an email that already exists' do
    User.create(email: 'test@email.com', username: 'testusername', name: 'Test Name', password: 'Test Password')
    signup

    expect(page).not_to have_content 'Welcome, test@email.com'
    expect(page).to have_content 'That email address is already registered, go back to sign in'

  end

end
