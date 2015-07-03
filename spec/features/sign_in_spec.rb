feature 'Signing in' do

  scenario 'exisitng user can give their username and password' do
    user = User.create(user_params)
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
    end
    click_button 'Sign in'
    expect(page).to have_content 'Hi test, here are your Peeps'
  end

  scenario 'an existing user cannot sign in if their password is incorrect' do
    user = User.create(user_params)
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: user.username
      fill_in 'password', with: 'not_the_right_password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'The email or password is incorrect'
  end

  def user_params
    { email: 'example@example.com',
      password: 'secret123',
      name: 'test',
      username: 'test_name' }
  end

end
