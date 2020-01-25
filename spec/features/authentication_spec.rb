feature 'signing in' do
  scenario 'when user signs in' do
    Users.create(username: 'Test name', email: 'test@me.com', password: '123password')
    visit '/sessions/new'
    fill_in :username, with: 'Test name'
    fill_in :password, with: '123password'
    click_button 'Sign in'
    expect(page).to have_content 'Welcome, Test name!'
  end

  scenario 'user provides invalid username' do
    Users.create(username: 'Test name', email: 'test@me.com', password: '123password')
    visit '/sessions/new'
    fill_in :username, with: 'Wrong name'
    fill_in :password, with: '123password'
    click_button 'Sign in'
    expect(page).not_to have_content 'Welcome, Test name!'
    expect(page).to have_content 'Please check your email or password.'
  end
end
