# in spec/features/authentication_spec.rb

feature 'authentication' do
  it 'a user can sign in' do
    User.create(username: 'a_user', firstname: 'Tom', lastname: 'Kellett', email: 'test@example.com', password: 'password123')
    # Then sign in as them
    visit '/home'
    click_button 'Log In'
    fill_in("username", with: 'a_user')
    fill_in("password", with: 'password123')
    click_button('Sign in')

    expect(page).to have_content ("@a_user")
    expect(page).to have_content ("Tom Kellett")
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(username: 'a_user', firstname: 'Tom', lastname: 'Kellett', email: 'test@example.com', password: 'password123')

    visit '/home'
    click_button 'Log In'
    fill_in("username", with: 'not_the_right_user')
    fill_in("password", with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content ("@a_user")
    expect(page).not_to have_content ("Tom Kellett")
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(username: 'a_user', firstname: 'Tom', lastname: 'Kellett', email: 'test@example.com', password: 'password123')

    visit '/home'
    click_button 'Log In'
    fill_in('username', with: 'a_user')
    fill_in('password', with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content ("@a_user")
    expect(page).not_to have_content ("Tom Kellett")
    expect(page).to have_content 'Please check your email or password.'
  end
end
