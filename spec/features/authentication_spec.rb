feature 'authentication' do
  scenario 'A user is able to find a button to log in' do
    visit('/')

    expect(page).to have_content('Log in')
  end

  scenario 'A user is redirected to the log in page' do
    visit('/')
    click_button('Log in')

    expect(page).to have_css("input#email")
    expect(page).to have_css("input#password")
  end

  scenario 'A user enters a correct email and password as is taken to the homepage' do
    params = {
      name: 'Feature Test',
      username: 'FtTest',
      email: 'featuretest@test.com',
      password: 'password'
    }

    User.create(params)

    visit('/sessions/new')

    fill_in('email', with: 'featuretest@test.com')
    fill_in('password', with: 'password')
    click_button('Log in')

    expect(page).to have_content("FtTest")
    expect(page).to have_content("Log out")
  end

  scenario 'A user sees an error if their email is not found' do
    params = {
      name: 'Feature Test',
      username: 'FtTest',
      email: 'featuretest@test.com',
      password: 'password'
    }

    User.create(params)

    visit('/sessions/new')

    fill_in('email', with: 'nottherightemail@test.com')
    fill_in('password', with: 'password')
    click_button('Log in')

    expect(page).not_to have_content("FtTest")
    expect(page).to have_content("The username and password are incorrect.")
  end

  scenario 'A user sees and error if their password is incorrect' do
    params = {
      name: 'Feature Test',
      username: 'FtTest',
      email: 'featuretest@test.com',
      password: 'password'
    }

    User.create(params)

    visit('/sessions/new')

    fill_in('email', with: 'featuretest@test.com')
    fill_in('password', with: 'incorrectpassword')
    click_button('Log in')

    expect(page).not_to have_content("FtTest")
    expect(page).to have_content("The username and password are incorrect.")
  end

  it 'a user can sign out' do
    params = {
      name: 'Feature Test',
      username: 'FtTest',
      email: 'featuretest@test.com',
      password: 'password'
    }
    User.create(params)

    visit('/sessions/new')
    fill_in('email', with: 'featuretest@test.com')
    fill_in('password', with: 'password')
    click_button('Log in')

    click_button('Log out')

    expect(page).not_to have_content 'FtTest'
    expect(page).to have_content 'You have signed out'
  end
end
