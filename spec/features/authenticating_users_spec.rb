feature 'authentication' do

  scenario 'user can sign in and out of Chitter i.e. be authenticated' do
    # Create a test user
    User.create(username: 'testuser1', handle: '@test',  password: 'password123')
    visit 'sessions/new'
    fill_in(:username, with: 'testuser1')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    # expect(page).to have_current_path('/peeps')
    expect(page).to have_content 'Welcome testuser1'
  end
  scenario 'user receives error message if they enter their username wrong i.e. user does not already exist ' do
    # Create a test user
    User.create(username: 'testuser1', handle: '@test',  password: 'password123')
    visit 'sessions/new'
    fill_in(:username, with: 'incorrect_username')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    # expect(page).to have_current_path('/peeps')
    expect(page).to have_content 'Please check your email or password. This user does not exist'
  end
end