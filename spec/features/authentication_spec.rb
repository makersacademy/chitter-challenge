feature 'Authentication' do
  scenario 'user successfully logs in' do
    User.create('test@gmail.com', 'password123')

    visit '/sessions/new'
    fill_in :email, with: 'test@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Log in'

    expect(page).to have_content "Welcome, test@gmail.com!"
  end

  scenario 'no such user' do
    User.create('test@gmail.com', 'password123')

    visit '/sessions/new'
    fill_in :email, with: 'another@gmail.com'
    fill_in :password, with: 'pass'
    click_button 'Log in'

    expect(page).not_to have_content "Welcome, test@gmail.com!"
    expect(page).to have_content "Please check your email or password"
  end

  scenario 'wrong password' do
    User.create('test@gmail.com', 'password123')

    visit '/sessions/new'
    fill_in :email, with: 'test@gmail.com'
    fill_in :password, with: 'wrongpassword'
    click_button 'Log in'

    expect(page).not_to have_content "Welcome, test@gmail.com!"
    expect(page).to have_content "Please check your email or password"
  end
end