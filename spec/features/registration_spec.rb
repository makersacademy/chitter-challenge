feature 'registration' do
  scenario 'a user can sign up' do
    new_user_sign_up
    expect(page).to have_content "Welcome, Test Name"
  end

  scenario 'a user signs up with an email that already exists' do
    new_user_sign_up

    visit '/'
    click_button 'Sign Up'
  
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Name')
    fill_in('user_name', with: 'a different name')
    click_button('Sign Up!')

    expect(page).to have_content "Email or Username already in use!"
  end

  scenario 'a user signs up with a username that already exists' do
    new_user_sign_up

    visit '/'
    click_button 'Sign Up'
  
    fill_in('email', with: 'different@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Name')
    fill_in('user_name', with: 'testusername')
    click_button('Sign Up!')

    expect(page).to have_content "Email or Username already in use!"
  end

end
