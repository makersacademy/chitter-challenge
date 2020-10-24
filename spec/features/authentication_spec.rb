feature 'authentication' do
  scenario 'user sees an error if their email is wrong' do
    User.create(email: 'test@testing.com', password: 'password123')

    visit 'sessions/new'
    fill_in('email', with: 'thewrongemail@failure.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).not_to have_content 'Welcome, test@testing.com'
    expect(page).to have_content 'AUTHENTICATION ERROR: please check your email or password and try again'
  end
  scenario 'user sees an error if their password is wrong' do
    User.create(email: 'test@testing.com', password: 'password123')

    visit 'sessions/new'
    fill_in('email', with: 'test@testing.com')
    fill_in('password', with: 'wrongpassword')
    click_button('Submit')

    expect(page).not_to have_content 'Welcome, test@testing.com'
    expect(page).to have_content 'AUTHENTICATION ERROR: please check your email or password and try again'
  end
end
