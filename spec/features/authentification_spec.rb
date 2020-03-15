feature 'authentication' do
  scenario 'a user can sign in' do
    User.create(name: 'Daria Thompson', username: 'dasha123', password: '12345', email: 'test@mexample.com')
    visit('/sessions/new')
    fill_in(:email, with: 'test@mexample.com')
    fill_in(:password, with: '12345')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, Daria Thompson'
  end

  scenario 'user sees an error message if email doesnt exist' do
    User.create(name: 'Daria Thompson', username: 'dasha123', password: '12345', email: 'test@mexample.com')
    visit('/sessions/new')
    fill_in(:email, with: 'test_wrong@mexample.com')
    fill_in(:password, with: '12345')
    click_button('Sign in')
    expect(page).not_to have_content 'Welcome, Daria Thompson'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'user sees an error if password is wrong' do
    User.create(name: 'Daria Thompson', username: 'dasha123', password: '12345', email: 'test@mexample.com')
    visit('/sessions/new')
    fill_in(:email, with: 'test@mexample.com')
    fill_in(:password, with: '12345678')
    click_button('Sign in')
    expect(page).not_to have_content 'Welcome, Daria Thompson'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user can sign out' do
    User.create(name: 'Daria Thompson', username: 'dasha123', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Daria Thompson'
    expect(page).to have_content 'You have signed out.'
  end
end
