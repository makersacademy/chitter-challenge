feature 'authentication' do
  it 'a user can log in if credentials are correct, and log in button dissapears' do
    # Create a test user
    user_create_dave

    # Then log in as them
    dave_log_in

    expect(current_path).to eq '/'
    expect(page).to have_content '@davedude'
    expect(page).to_not have_link 'Log in'
  end

  it 'a user cannot log in if email is not registered, sees error at login screen' do
    # Create a test user
    user_create_dave

    # Attempt log in with incorrect email
    visit '/'
    click_on 'Log in'
    fill_in(:email, with: 'wrongemail@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    expect(current_path).to eq '/sessions/new'
    expect(page).to_not have_content '@davedude'
    expect(page).to have_content 'Email or password incorrect'
  end

  it 'a user cannot log in if password is incorrect, sees error at login screen' do
    # Create a test user
    user_create_dave

    # Attempt log in with incorrect password
    visit '/'
    click_on 'Log in'
    fill_in(:email, with: 'davedude@example.com')
    fill_in(:password, with: 'incorrect')
    click_button('Log in')

    expect(current_path).to eq '/sessions/new'
    expect(page).to_not have_content '@davedude'
    expect(page).to have_content 'Email or password incorrect'
  end

  it 'User can see log out button only if they are already logged in' do
    # Create a test user
    user_create_dave

    visit '/'
    expect(page).to_not have_button 'Log out'
    
    # Then log in as them
    dave_log_in
    
    expect(current_path).to eq '/'
    expect(page).to have_content '@davedude'
    expect(page).to have_button 'Log out'
  end

  it 'User can click log out button and it will log them out' do
    # Create a test user
    user_create_dave
    
    # Then log in as them
    dave_log_in

    click_button 'Log out'
    expect(current_path).to eq '/'
    expect(page).to_not have_content '@davedude'
    expect(page).to have_content 'You have logged out'
  end
end
