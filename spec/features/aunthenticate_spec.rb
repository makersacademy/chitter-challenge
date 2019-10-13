feature 'authenticate' do
  scenario 'user signs in' do
    Users.create(name: 'name', username: 'user', email: 'user@user.com', password: 'password')

    visit '/homepage'
    click_button 'Sign in'

    fill_in 'email', with: 'user@user.com'
    fill_in 'password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content 'Welcome, user'
  end

  scenario 'user sees error if email wrong' do
    Users.create(name: 'name', username: 'user', email: 'user@user.com', password: 'password')

    visit '/homepage'
    click_button 'Sign in'

    fill_in 'email', with: 'fakeemail@user.com'
    fill_in 'password', with: 'password'
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome, user@user.com'
    expect(page).to have_content 'Invalid email, please try again'
  end
end
