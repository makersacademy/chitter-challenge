feature 'authentication' do
  scenario 'a user can sign in' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', username: 'riya', password: 'password123')

    visit '/sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome Riya Dattani'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', username: 'riya', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome Riya Dattani'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', username: 'riya', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome Riya Dattani'
    expect(page).to have_content 'Please check your email or password.'
  end
end
