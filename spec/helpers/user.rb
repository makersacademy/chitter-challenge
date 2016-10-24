module UserHelpers

  def sign_up(name:                   'Another test',
              email:                  'test@test.com',
              username:               'test',
              password:               'test',
              password_confirmation:  'test',
              click:                  true)


    visit '/user/register'
    fill_in :name,                   with: name
    fill_in :email,                  with: email
    fill_in :username,               with: username
    fill_in :password,               with: password
    fill_in :password_confirmation,  with: password_confirmation
    click_button 'Sign up'           if click
  end

  def sign_in(email: 'test@test.com', password: 'test', click: true)
     visit '/user/sign-in'
     fill_in :email,    with: email
     fill_in :password, with: password
     click_button 'Sign in' if click
  end

  def sign_out
     click_button 'Sign out'
  end
end
