feature 'Sign in' do
  scenario 'A user can sign in' do
    User.create(email: 'test@test.com', password: 'Password123', display_name: 'Test User', username: 'test')

    visit '/sessions/new'
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'Password123')
    click_button('sign_in')

    expect(page).to have_content('Welcome, Test User')
  end

  scenario 'A user sees an error if their email is wrong' do
    User.create(email: 'test@test.com', password: 'Password123', display_name: 'Test User', username: 'test')

    visit '/sessions/new'
    fill_in('email', with: 'tes@test.com')
    fill_in('password', with: 'Password123')
    click_button('sign_in')

    expect(page).not_to have_content('Welcome, Test User')
    expect(page).to have_content('Please check your email or password')
  end

  scenario 'A user sees an error if their password is wrong' do
    User.create(email: 'test@test.com', password: 'Password123', display_name: 'Test User', username: 'test')

    visit '/sessions/new'
    fill_in('email', with: 'tes@test.com')
    fill_in('password', with: 'Password123')
    click_button('sign_in')

    expect(page).not_to have_content('Welcome, Test User')
    expect(page).to have_content('Please check your email or password')
  end
end