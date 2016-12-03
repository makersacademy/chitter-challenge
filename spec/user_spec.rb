require_relative '../app/models/user'

describe User do

  let!(:user) do
    User.create(email: 'foo@foo.com', password: '123secret',
    username: 'foo', name: 'Foo McFooface')
  end

  describe '::authenticate' do

    it 'should authenticate when given a valid email address and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'should not authenticate when given an invalid password' do
      expect(User.authenticate(user.email, 'wrong password')).to be_nil

    end

  end

end
