describe User do

  # Used let! because DatabaseCleaner cleans database before/after every test
  # let! forces method's invocation before each example
  let!(:user) {
    User.create(
      email: 'bob@bob.com',
      password: 'password',
      password_confirmation: 'password'
    )
  }

  let(:registered_password) { 'password' }

  it "gets authenticated if credentials are correct" do
    expect(BCrypt::Password.new(user.password_digest)).to eq(registered_password)
  end

  describe "#authenticate" do
    # it "authenticates and returns a user" do
    #   expect(User.authenticate('bob@bob.com', 'password')).to eq(user)
    # end

    it "fails authentication if user doesn't exist" do
      expect(User.authenticate('bob@cat.com', 'password')).to be_nil
    end
  end

  describe '#generate_token' do
    it "saves a password recovery token when we generate a token" do
       expect{user.generate_token}.to change{user.password_token}
    end

    it "saves a password recovery token time when we generate a token using" do
      Timecop.freeze do
        user.generate_token
        expect(user.password_token_time).to eq Time.now
      end
    end

  #   it 'can find a user with a valid token' do
  #    user.generate_token
  #    expect(User.find_by_valid_token(user.password_token)).to eq user
  #  end

    it 'can\'t find a user with a token over 1 hour in the future' do
      user.generate_token
      Timecop.travel(60 * 60 + 1) do
        expect(User.find_by_valid_token(user.password_token)).to eq nil
      end
    end
  end

end
