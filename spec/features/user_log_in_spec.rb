feature 'User Log In' do
  scenario 'a user can sign in' do
    User.create(name: 'testname', username: 'testusername', email: 'test@email.com', password: 'testpassword')

    visit '/sessions/new'
    fill_in(:username, with: 'testusername')
    fill_in(:password, with: 'testpassword')
    click_button('Sign In')

    expect(page).to have_content 'Welcome to Chitter testusername'
  end

  scenario 'does not allow user to log in with incorrect username' do
    User.create(name: 'testname', username: 'testusername', email: 'test@email.com', password: 'testpassword')
    
    visit '/sessions/new'
    fill_in(:username, with: 'wrongusername')
    fill_in(:password, with: 'testpassword')
    click_button('Sign In')

    expect(page).not_to have_content 'Welcome to Chitter testusername'
    expect(page).to have_content 'Incorrect username or password'
  end

  scenario 'does not allow user to log in with incorrect password' do
    User.create(name: 'testname', username: 'testusername', email: 'test@email.com', password: 'testpassword')
    
    visit '/sessions/new'
    fill_in(:username, with: 'testusername')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign In')

    expect(page).not_to have_content 'Welcome to Chitter testusername'
    expect(page).to have_content 'Incorrect username or password'
  end
end
