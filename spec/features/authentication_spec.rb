feature 'authentication' do
  scenario 'a user can sign in' do
    User.create(username: 'johndoe', email: 'test@test.com', password: 'password123')

    visit '/sessions'
    fill_in(:username, with: 'johndoe')
    fill_in(:password, with: 'password123')
    click_button('sign in')

    expect(page).to have_content 'Welcome, johndoe'
  end

  scenario 'a user can sign out' do
    User.create(username: 'johndoe', email: 'test@test.com', password: 'password123')
    visit '/sessions'
    fill_in(:username, with: 'johndoe')
    fill_in(:password, with: 'password123')
    click_button('sign in')
    click_button('Sign out')
    expect(page).not_to have_content 'Welcome, johndoe'
    expect(page).to have_content 'You have signed out'
  end
end
