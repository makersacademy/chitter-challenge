feature 'authentication' do
  scenario 'a user can sign in' do
    create_test_user
    log_in_test
    expect(page).to have_content 'Welcome, test123!'
  end
  
  scenario 'a user sees an error if their email is wrong' do 
    create_test_user
    
    visit '/sessions/new'
    fill_in(:email, with: 'incorrectemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test123!'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if their password is wrong' do
    create_test_user

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'incorrectpassword')
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome, test123!'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    create_test_user
    log_in_test
    click_button 'Sign out'
    expect(page).not_to have_content 'Welcome, test123'
    expect(page).to have_content 'You have signed out.'
  end
end
