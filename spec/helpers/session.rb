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
    click_button('Register')
  end
end
