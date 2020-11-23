feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'test@example.com', password: 'password123')
    visit '/login'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign in!'

    expect(page.current_path).to eq '/welcome'
    expect(page).to have_content 'Welcome back, test@example.com!'
  end

  it 'a user sees an error if their email is incorrect' do
    User.create(email: 'test@example.com', password: 'password123')

    visit '/login'
    fill_in 'email', with: 'wrongemail@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign in!'

    expect(page).not_to have_content 'Welcome back, test@example.com!'
    expect(page.current_path).to eq '/login'
    expect(page).to have_content 'Please correct your email or password!'
  end

  it 'a user sees an error if their password is incorrect' do
    User.create(email: 'test@example.com', password: 'password123')
    visit '/login'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'thewrongpassword'
    click_button 'Sign in!'

    expect(page).not_to have_content 'Welcome back, test@example.com!'
    expect(page.current_path).to eq '/login'
    expect(page).to have_content 'Please correct your email or password!'
  end

  it 'a user can sign out' do
    User.create(email: 'test@example.com', password: 'password123')

    visit '/login'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign in!'
    click_link "Now lemme see those peeps!"
    click_button 'Sign out!'
    
    expect(page).to have_content "You're now signed out!"
  end
end
