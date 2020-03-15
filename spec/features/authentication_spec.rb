feature 'authentication' do
  it 'a user can sign in' do
    User.create(name: 'Josie', email: 'test@example.com', password: 'password123')

    # Then sign in as them:
    visit '/sessions/new'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'password123'
    click_button 'Sign in'

    expect(page).to have_content "Welcome, Josie"
  end

  it 'a user sees an error if they get their email wrong' do
    User.create(name: 'Josie', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in :email, with: 'nottherightemail@example.com'
    fill_in :password, with: 'password123'
    click_button 'Sign in'

    expect(page).not_to have_content "Welcome, Josie"
    expect(page).to have_content "Please check your email or password"
  end

  it 'a user sees an error if they get their password wrong' do
    User.create(name: 'Josie', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'wrongpassword'
    click_button 'Sign in'

    expect(page).not_to have_content "Welcome, Josie"
    expect(page).to have_content "Please check your email or password"    
  end
end
