
describe User do

  let(:user) {described_class.new}

  let(:user) do
  User.create(email: "scott@example.com", password: "1", password_confirmation: "1")
end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
end

describe User do

  let(:user) do
  User.create(email: "scott@example.com", password: "2", password_confirmation: "1")
end

  it 'does not authenticate a user when given a valid email and invalid password' do
    unauthenticated_user = User.authenticate(user.email, user.password)
    expect(unauthenticated_user).to eq nil
  end
end
