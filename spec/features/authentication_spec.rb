feature 'authentication' do
  scenario 'a user can sign in' do
    User.create(
      email: 'test4@example.com',
      password: 'password123',
      name: 'Test Name',
      username: '@test_user4'
    )

    visit '/sessions/new'
    fill_in 'email', with: 'test4@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Log in'

    expect(page).to have_content 'Welcome, Test Name'
  end

  scenario 'a user sees an error if the email is invalid' do
    User.create(
      email: 'test6@example.com',
      password: 'password123',
      name: 'Test Name',
      username: '@test_user6'
    )

    visit '/sessions/new'
    fill_in 'email', with: 'totallywrong@email.com'
    fill_in 'password', with: 'password123'
    click_button 'Log in'

    expect(page).not_to have_content 'Welcome, Test Name'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user sees an error if they enter the incorrect password' do
    User.create(
      email: 'test8@example.com',
      password: 'password123',
      name: 'Test Name',
      username: '@test_user8'
    )

    visit '/sessions/new'
    fill_in 'email', with: 'test8@example.com'
    fill_in 'password', with: 'wrongpassword'
    click_button 'Log in'

    expect(page).not_to have_content 'Welcome, Test Name'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user can sign out' do
    User.create(
      email: 'test9@example.com',
      password: 'password123',
      name: 'Test Name',
      username: '@test_user9'
    )

    visit '/sessions/new'
    fill_in 'email', with: 'test9@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Log in'

    click_button 'Log out'

    expect(page).not_to have_content 'Welcome, Test Name'
    expect(page).to have_content 'You have signed out'
  end
end 