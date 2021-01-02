feature 'Sign up' do

  scenario 'rejects if a username or email already exists' do
    User.create(email: 'test@example.com', password: 'password123', name:'Kitty', username:'HelloKitty')
    visit '/'
    click_button 'Join Chitter today'
    fill_in 'username', with: 'HelloKitty'
    fill_in 'password', with: 'password123'
    fill_in 'confirm_password', with: 'password123'
    fill_in 'name', with: 'Panda'
    fill_in 'email', with: 'random@gmail.com'
    click_on 'Sign Up'
    expect(page).to have_content 'The email or username is already taken.'
  end
end