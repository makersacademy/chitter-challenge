feature 'Registration' do
  scenario 'a user can sign up' do
    visit('/')
    click_button 'Sign Up'

    expect(current_path).to eq '/users/sign-up'

    fill_in 'name', with: 'Melissa Sedgwick'
    fill_in 'username', with: 'mel_01'
    fill_in 'email', with: 'melissa@test.com'
    fill_in 'password', with: 'password123'
    click_button 'Submit'

    expect(page).to have_content "Welcome, Melissa Sedgwick"
  end

  scenario 'user cannot create second account with same email address' do
    User.create(name: 'Test', username: 'test', email: 'test@test.com',
      password: 'password'
    )

    visit('/')
    click_button 'Sign Up'
    fill_in 'name', with: 'Test'
    fill_in 'username', with: 'test_again'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password123'
    click_button 'Submit'
    expect(page).not_to have_content("Welcome, Test")
    expect(page).to have_content("Email address already in use")
  end

  scenario 'user cannot create new account with existing username' do
    User.create(name: 'Test', username: 'test', email: 'test@test.com',
      password: 'password'
    )

    visit('/')
    click_button 'Sign Up'
    fill_in 'name', with: 'Test'
    fill_in 'username', with: 'test'
    fill_in 'email', with: 'test2@test.com'
    fill_in 'password', with: 'password123'
    click_button 'Submit'
    expect(page).not_to have_content("Welcome, Test")
    expect(page).to have_content("Username already in use")
  end
end
