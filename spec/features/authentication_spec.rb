feature 'Logging in' do
  scenario 'user logs in with the right email and password' do
    User.create(
      first_name: 'Happy', last_name: 'Auth', username: 'happyauth', email: 'happy@auth.com', password: '12345'
    )
    visit('/')

    click_button 'Log in'

    fill_in :email, with: 'happy@auth.com'
    fill_in :password, with: '12345'

    click_button 'Log in'
    
    expect(current_path).to eq('/')
    expect(page).to have_content('Successfully logged in as happyauth')
    expect(page).not_to have_button('Log in')
    expect(page).not_to have_content('Log in')
    expect(page).not_to have_button('Sign up')
    expect(page).not_to have_content('Sign up')
  end

  scenario 'user enters an invalid email' do
    User.create(
      first_name: 'Bad', last_name: 'Email', username: 'boohoo', email: 'test@auth.com', password: '12345'
    )
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
      first_name: 'Bad', last_name: 'Password', username: 'boohoo', email: 'badpw@auth.com', password: '12345'
    )
    visit('/')

    click_button 'Log in'
    expect(current_path).to eq('/user/login')
    fill_in :email, with: 'badpw@auth.com'
    fill_in :password, with: 'thewrongpassword'
    click_button 'Log in'
    
    expect(current_path).to eq('/user/login')
    expect(page).to have_content("Please check your password is correct")
  end

  scenario 'user logs in and goes to user/login' do
    User.create(
      first_name: 'Happy', last_name: 'Auth', username: 'happyauth', email: 'happy@auth.com', password: '12345'
    )
    visit('/')

    click_button 'Log in'
    expect(current_path).to eq('/user/login')
    fill_in :email, with: 'happy@auth.com'
    fill_in :password, with: '12345'
    click_button 'Log in'
    
    visit('/user/login')

    expect(page).to have_content("Already logged in as happyauth")
    expect(current_path).to eq('/')
  end

  scenario 'user logs in and goes to user/new' do
    User.create(
      first_name: 'Happy', last_name: 'Auth', username: 'happyauth', email: 'happy@auth.com', password: '12345'
    )
    visit('/')

    click_button 'Log in'
    expect(current_path).to eq('/user/login')
    fill_in :email, with: 'happy@auth.com'
    fill_in :password, with: '12345'
    click_button 'Log in'
    
    visit('/user/new')

    expect(page).to have_content("Please log out first")
    expect(current_path).to eq('/')
  end
end

feature 'logging out:' do
  scenario 'user logs out' do
    User.create(
      first_name: 'Happy', last_name: 'Auth', username: 'happyauth', email: 'happy@auth.com', password: '12345'
    )

    visit('/')

    click_button 'Log in'
    expect(current_path).to eq('/user/login')
    fill_in :email, with: 'happy@auth.com'
    fill_in :password, with: '12345'
    click_button 'Log in'
    
    click_button 'Log out'

    expect(page).to have_content('You have logged out')
    expect(page).to have_button('Log in')
    expect(page).to have_button('Sign up')
  end
  
  scenario 'user cannot log out if they are not logged in' do
    visit('/user/logout')

    expect(page).to have_content("You are not logged in")
    expect(current_path).to eq('/user/login')
  end
end
