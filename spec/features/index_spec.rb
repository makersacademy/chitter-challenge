feature '/sign_up' do
  scenario 'A user can sign up' do 
    visit '/'
    click_on 'Sign up'
    fill_in 'username', with: 'Test User'
    fill_in 'email', with: 'example@email.com'
    fill_in 'password', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content 'What is on your mind Test User?'
  end
end 

feature '/log_in' do
  scenario 'A user can log in' do 
    User.create(name: 'Test User', email: 'test@example.com', password: 'password123')

    visit '/'
    click_on 'Log in'
    fill_in 'username', with: 'Test User'
    fill_in 'password', with: 'password123'
    click_on 'Log in'
    expect(page).to have_content 'What is on your mind Test User?'
  end 

  scenario 'a user sees an error if they get their username wrong' do
    User.create(name: 'Test User', email: 'test@example.com', password: 'password123')

    visit '/log_in'
    fill_in 'username', with: 'Test'
    fill_in 'password', with: 'password123'
    click_button('Log in')

    expect(page).not_to have_content 'What is on your mind Test User?'
    expect(page).to have_content 'Please check your username or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(name: 'Test User', email: 'test@example.com', password: 'password123')

    visit '/log_in'
    fill_in 'username', with: 'Test User'
    fill_in 'password', with: 'password125'
    click_on 'Log in'

    expect(page).not_to have_content 'What is on your mind Test User?'
    expect(page).to have_content 'Please check your username or password.'
  end
end 

feature '/log_out' do 
  scenario 'a user can log out at the end of their session' do 
    User.create(name: 'Test User', email: 'test@example.com', password: 'password123')

    
    visit '/log_in'
    fill_in 'username', with: 'Test User'
    fill_in 'password', with: 'password123'
    click_on 'Log in'
    click_on 'Log out'
  end
end 

feature '/home' do 
  scenario 'you get greeted by a list of tweets' do 
    visit '/home' 
    expect(page).to have_content "my first tweet"
  end 
end 
