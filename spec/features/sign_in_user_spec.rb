feature 'signing in' do
  scenario 'user can sign in' do

    # sign-up first
    visit '/accounts/new'
    fill_in :email, with: 'user@example.com'
    fill_in :name, with: 'Test User'
    fill_in :username, with: 'testuser'
    fill_in :password, with: '123456'
    click_button 'Sign-up!'
    
    # log in
    visit '/accounts/login'
    fill_in :email, with: 'user@example.com'
    fill_in :password, with: '123456'
    click_button 'Log-in!'

    expect(page).to have_content 'Hello, testuser'

  end

  scenario 'user is shown a flash error when using bad credentials' do

    # sign-up first
    visit '/accounts/new'
    fill_in :email, with: 'user@example.com'
    fill_in :name, with: 'Test User'
    fill_in :username, with: 'testuser'
    fill_in :password, with: '123456'
    click_button 'Sign-up!'
    
    # log in with bad creds
    visit '/accounts/login'
    fill_in :email, with: 'user@example.com'
    fill_in :password, with: '12345'
    click_button 'Log-in!'

    expect(page).to have_content 'Bad username and password. Please try again.'

  end
end
