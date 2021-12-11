feature 'authentication' do 
  it 'a user can sign in' do 
    # Create a test user
    User.create(name: 'test', email: 'test@example.com', password: 'password123')

    # Then sign in as them 
    visit 'sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Login')

    expect(page).to have_content 'Welcome'
  end


  it 'a user sees an error if they get their email wrong' do 
    User.create(name: 'test', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Login')

    # expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end 

  scenario 'a user sees an error if they get their password wrong' do
    User.create(name: 'test', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Login')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    User.create(name: 'test', email: 'test@example.com', password: 'password123')
    
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')

    click_button('Login')

    click_link('Logout')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have successfully signed out.'
  end
end