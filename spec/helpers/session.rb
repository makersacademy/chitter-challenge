module SessionHelpers

  def sign_up(name: 'Bob',
    username: 'Bobmcbobface',
    email: 'bob@bob.com',
    password: 'pwd')

    visit '/users/new'
    fill_in 'name', with: name
    fill_in 'username', with: username
    fill_in 'email', with: email
    fill_in 'password', with: password
    # require'pry';binding.pry

    click_button('Sign up')
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
