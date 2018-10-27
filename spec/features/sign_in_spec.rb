feature 'Sign In' do
  scenario 'a user can sign in' do
    User.create(name: "Test Name", username: "Test username",
      email: "test@test.com", password: "password123"
    )

    visit('/')
    click_button 'Sign In'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign In'

    expect(page).to have_content "Welcome, Test Name"
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(name: "Test Name", username: "Test username",
      email: "test@test.com", password: "password123"
    )

    visit '/'
    click_button 'Sign In'
    fill_in 'email', with: 'fakeemail@test.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign In'

    expect(page).not_to have_content 'Welcome, Test Name'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(name: "Test Name", username: "Test username",
      email: "test@test.com", password: "password123"
    )

    visit '/'
    click_button 'Sign In'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'wrongpassword'
    click_button 'Sign In'

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end
end
