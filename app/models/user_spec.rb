require_relative 'user'

describe User do
  let(:user) do
    User.create(email: 'hello@hello.com',
                password: 'abcd')
  end

  it 'authenticates when given a valid email and password' do
    authentic_user = User.authenticate(user.email, user.password)
    expect(authentic_user).to eq user
  end
end
