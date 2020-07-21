feature 'authentication' do
  scenario 'a user can successfully sign in' do
    User.create(email: 'cat@email.com', password: 'password123', name: 'Cat', username: 'catty')
    visit('/sessions/new')
    fill_in(:email, with: 'cat@email.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, cat@email.com'
  end

  scenario 'a user sees an error if their email is incorrect' do
    User.create(email: 'cat@email.com', password: 'password123', name: 'Cat', username: 'catty')
    visit('/sessions/new')
    fill_in(:email, with: 'cate@email.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).not_to have_content 'Welcome, cat@email.com'
    expect(page).to have_content 'Please check your email or password'
  end
end
