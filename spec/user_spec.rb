require_relative '../app/models/user.rb'

describe User do
  it{is_expected.to respond_to(:name)}
  it{is_expected.to respond_to(:password=)}
  it 'authenticates a user at log-in' do
    user = User.new(name: 'test',
                    username: 'test',
                    email: 'test@test.test',
                    password: '1234hidden',
                    password_confirmation: '1234hidden')
    user.save
    p user
    authenticated_user = user.authenticate(user.username,user.password)
    expect(authenticated_user).to eq user
  end
end
