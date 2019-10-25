require 'user_class'
describe User do
  it '.register' do
    User.register(username: 'username', email: 'test@testing.com', password: 'password')

    expect($current_session).to eq true
  end

  it '.logout' do
    User.register(username: 'username', email: 'test@testing.com', password: 'password')
    User.logout()
    expect($current_session).to eq false
  end

  it '.login' do
    User.register(username: 'username', email: 'test@testing.com', password: 'password')
    User.logout()
    User.login(username: 'username', password: 'password')
    expect($current_session).to eq true
  end

end
