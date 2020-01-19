feature 'User Log In' do
  it 'a user can sign in' do
    User.create(name: 'testname', username: 'testusername', email: 'test@email.com', password: 'testpassword')

    visit '/sessions/new'
    fill_in(:username, with: 'testusername')
    fill_in(:password, with: 'testpassword')
    click_button('Sign In')

    expect(page).to have_content 'Welcome to Chitter testusername'
  end
end