feature 'signing in' do
  scenario 'user can sign in' do
    User.create(email: 'test@example.com', password: 'password123', name:'Kitty', username:'HelloKitty')
    visit '/'
    sign_up
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    find('#login-button').click

    expect(page).to have_content 'Welcome back, Panda!'
  end
end