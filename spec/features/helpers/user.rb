module UserHelpers

  def sign_up(name:                   'Another Name',
              email:                  'test@test.com',
              username:               'test',
              password:               '1234',
              password_confirmation:  '1234',
              click:                  true)


    visit '/user/register'
    fill_in :first_name,             with: first_name
    fill_in :last_name,              with: last_name
    fill_in :email,                  with: email
    fill_in :password,               with: password
    fill_in :password_confirmation,  with: password_confirmation
    click_button 'Sign up' if click
  end

  def sign_in(email: 'test@test.com', password: '1234', click: true)
     visit '/user/sign-in'
     fill_in :email,    with: email
     fill_in :password, with: password
     click_button 'Sign in' if click
  end

  def sign_out
     click_button 'Sign out'
  end
end
