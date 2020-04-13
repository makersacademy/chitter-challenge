feature 'authentication' do
  scenario 'a user can sign in' do
    sign_up

    sign_in('test@example.com', 'password123')
    expect(page).to have_content 'Welcome, testname'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: 'password123', 
      username: 'testusername', name: 'testname')

    visit '/'
    sign_in('nottherightemail@me.com', 'password123')

    expect(page).not_to have_content 'Welcome, testname'
    expect(page).to have_content 'Please check your email or password.'
  end

end
