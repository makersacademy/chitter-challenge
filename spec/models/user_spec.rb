require 'spec_helper.rb'

describe User do

  let!(:user) do
    User.create(name: 'spec', username: 'spec', email: 'spec@email.com',
                password: 'spec123')
  end

  it 'authenticates when given a vaild email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
end
