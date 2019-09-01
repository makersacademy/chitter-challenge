feature 'authentication' do
  scenario 'a user can log in' do
    user = User.create(name: 'John', email: 'test@example.com', password: 'password123')
    visit '/login'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')
    expect(page).to have_content 'Welcome, John'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(name: 'John', email: 'test@example.com', password: 'password123')
    visit '/login'
    fill_in(:email, with: 'wrongemail@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')
    expect(page).not_to have_content 'Welcome, John'
    expect(page).to have_content 'Incorrect log in details. Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(name: 'John', email: 'test@example.com', password: 'password123')
    visit '/login'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Log in')
    expect(page).not_to have_content 'Welcome, John'
    expect(page).to have_content 'Incorrect log in details. Please check your email or password.'
  end
end
