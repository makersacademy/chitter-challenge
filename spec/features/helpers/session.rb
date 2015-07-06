module SessionHelpers

  def sign_up
    user = User.new(user_params)
    visit '/'
    within 'form#sign_up' do
      fill_in 'username', with: user.username
      fill_in 'name', with: user.name
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
    end
    click_button 'Sign up'
  end

  def sign_in
    @user = User.create(user_params)
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: @user.username
      fill_in 'password', with: @user.password
    end
    click_button 'Sign in'
  end

  def peep_hello_world
    within 'form#peep' do
      fill_in 'peep', with: 'Hello world!'
      click_button 'Peep'
    end
  end

  def another_user_peeps
    user = User.create(another_user_params)
    visit '/'
    within 'form#sign_in' do
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
    end
    click_button 'Sign in'
    peep_hello_world
    click_button 'Sign out'
  end

  def user_params
    { email: 'example@example.com',
      password: 'secret123',
      name: 'test',
      username: 'test_name' }
  end

  def another_user_params
    { email: 'another_example@example.com',
      password: 'another_secret123',
      name: 'another',
      username: 'another_name' }
    end

end
