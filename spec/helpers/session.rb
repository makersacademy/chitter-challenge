module SessionHelpers
  def sign_up(name: 'Giamir Buoncristiani',
              username: 'giamir',
              email: 'giamir@email.com',
              password: 'giamir')
    visit('/users/new')
    fill_in(:name, with: name)
    fill_in(:username, with: username)
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    click_button('Sign up')
  end

  def sign_in(user_or_email: 'giamir', password: 'giamir')
    User.create(name: 'Giamir Buoncristiani',
                username: 'giamir',
                email: 'giamir@email.com',
                password: 'giamir')
    visit('/sessions/new')
    fill_in('user_or_email', with: user_or_email)
    fill_in('password', with: password)
    click_button('Log in')
  end

  def sign_out
    sign_in
    click_button('Log out')
  end
end
