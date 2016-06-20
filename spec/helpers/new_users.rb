module NewUsers

  def sign_up
    visit '/'
    click_link 'Sign up'
    fill_in 'email', with: 'bob@bob.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    fill_in 'user_name', with: 'bob'
    fill_in 'real_name', with: 'Bob McBob'
    click_button 'Sign up'
  end

  def user_create
    User.create(email: 'bob@bob.com',
                user_name: 'bob',
                real_name: 'Bob McBob',
                password: 'password',
                password_confirmation: 'password')
  end

end
