module UserHelpers

  def add_user(user)
    User.create(email: user.email,
                password: user.password,
                password_confirmation: user.password_confirmation,
                real_name: user.real_name,
                user_name: user.user_name)
  end

  def sign_up(user)
     visit '/users/new'
     expect(page.status_code).to eq(200)
     fill_in :sign_up_email,    with: user.email
     fill_in :sign_up_password, with: user.password
     fill_in :password_confirmation, with: user.password_confirmation
     fill_in :real_name, with: user.real_name
     fill_in :user_name, with: user.user_name
     click_button 'Sign up'
  end
  #
  def sign_in(user)
     visit '/chits'
     expect(page.status_code).to eq(200)
     fill_in :email,    with: user.email
     fill_in :password, with: user.password
     click_button 'Sign in'
  end
end
