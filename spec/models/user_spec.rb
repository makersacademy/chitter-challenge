require 'timecop'

describe User do

  let!(:user) do
    User.create(email: 'test@test.com', name: 'Mr Test', username: 'MyTestUser', password: 'secret1234',
               password_confirmation: 'secret1234')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it "saves a password recovery token time when we generate a token using" do
    Timecop.freeze do
      user.generate_token
      expect(user.password_token_time).to eq Time.now
    end
  end

  it 'can\'t find a user with a token over 1 hour in the future' do
    user.generate_token
    Timecop.travel(60 * 60 + 1) do
      expect(User.find_by_valid_token(user.password_token)).to eq nil
    end
  end
end
