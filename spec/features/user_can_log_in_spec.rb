feature 'User login' do
  scenario 'User can login with username and password' do
    sign_in

    expect(page).to have_content 'Welcome Chrissy, start peeping now!'
  end

  scenario 'User sees an error message if they logged in with the wrong username' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Chrissy', username: 'chrisc')

    visit '/peeps'
    click_button 'Sign in'
    fill_in(:username, with: 'chrissycc')
    fill_in(:password, with: 'password123')
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome Chrissy, start peeping now!'
    expect(page).not_to have_content 'Please check your username or password.'
  end

  scenario 'User sees an error message if they logged in with the wrong password' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Chrissy', username: 'chrisc')

    visit '/peeps'
    click_button 'Sign in'
    fill_in(:username, with: 'chrissycc')
    fill_in(:password, with: 'password111')
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome Chrissy, start peeping now!'
    expect(page).not_to have_content 'Please check your username or password.'
  end
end
