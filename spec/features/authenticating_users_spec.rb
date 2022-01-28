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
end