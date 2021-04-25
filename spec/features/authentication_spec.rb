feature 'authentication' do
  it 'a user can sign in' do
    User.create(username: 'testname', password: 'password123')
    visit '/'

    fill_in(:username, with: 'testname')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    expect(page).to have_content 'Welcome testname'
  end

  scenario 'a user sees an error with wrong email' do
    User.create(username: 'testname', password: 'password123')

    visit '/'
    fill_in(:username, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    expect(page).not_to have_content 'Welcome, testname'
    expect(page).to have_content 'Please check your details.'
  end

  scenario 'a user sees an error for wrong password' do
    User.create(username: 'testname', password: 'password123')

    visit '/'
    fill_in(:username, with: 'testname')
    fill_in(:password, with: 'wrongpassword')
    click_button('Log in')

    expect(page).not_to have_content 'Welcome, testname'
    expect(page).to have_content 'Please check your details.'
  end

  scenario 'a user can sign out' do
    User.create(username: 'testname', password: 'password123')

    visit '/'
    fill_in(:username, with: 'testname')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    click_button('Log out')

    expect(page).not_to have_content 'Welcome, testname'
    expect(page).to have_content 'You have logged out.'
  end
end