feature 'Authentication' do
  scenario 'user can log in with the right email and password' do
    User.create(
      first_name: 'Happy', last_name: 'Auth', username: 'happyauth', email: 'happy@auth.com', password: '12345')
    visit('/')

    click_button 'Log in'

    fill_in :email, with: 'happy@auth.com'
    fill_in :password, with: '12345'

    click_button 'Log in'
    
    expect(current_path).to eq('/')
    expect(page).to have_content 'Successfully logged in as happyauth'
  end

  scenario 'user enters an invalid email' do
    User.create(
      first_name: 'Bad', last_name: 'Email', username: 'boohoo', email: 'test@auth.com', password: '12345')
    visit('/')

    click_button 'Log in'

    fill_in :email, with: 'wrongemail@auth.com'
    fill_in :password, with: '12345'

    click_button 'Log in'
    
    expect(current_path).to eq('/user/login')
    expect(page).to have_content("An account with that email doesn't exist")
  end

  scenario 'user enters the right email but wrong password' do
    User.create(
      first_name: 'Bad', last_name: 'Password', username: 'boohoo', email: 'badpw@auth.com', password: '12345')
    visit('/')

    click_button 'Log in'

    fill_in :email, with: 'badpw@auth.com'
    fill_in :password, with: 'thewrongpassword'

    click_button 'Log in'
    
    expect(current_path).to eq('/user/login')
    expect(page).to have_content("Please check your password is correct")
  end
end
