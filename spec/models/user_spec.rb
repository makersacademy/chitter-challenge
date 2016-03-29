require_relative '../../app/models/user'

describe User do
  let!(:user) do
    User.create(first_name: 'Annemarie', last_name: 'Kohler', username: 'Anne',
      email: 'anne@chittr.com', password: 'dog', password_confirmation: 'dog')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end


end
