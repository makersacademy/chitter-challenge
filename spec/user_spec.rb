require_relative '../app/models/user.rb'

describe User do
  let!(:user) do
    User.create(name: 'test',
                username: 'test',
                email: 'test@test.test',
                password: '1234hidden',
                password_confirmation: '1234hidden')
  end

  it{is_expected.to respond_to(:name)}
  it{is_expected.to respond_to(:password=)}
  it 'authenticates a user at log-in' do
    authenticated_user = User.authenticate(user.username,user.password)
    expect(authenticated_user).to eq user
  end
end
