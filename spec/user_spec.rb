describe User do

  let!(:user) do
    User.create(email: 'example@gmail.com',
                password: 'password1234',
                password_confirmation: 'password1234')
  end

  describe '#authenticate' do
    it 'should authenticate the user if password matches' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate user if password is incorrect' do
      non_authenticated_user = User.authenticate(user.email, "incorrect")
      expect(non_authenticated_user).to be_nil
    end
  end

  describe '#generate_token' do
    it 'saves a password recovery token when we generate a token' do
      expect { user.generate_token }.to change{ user.password_token }
    end

    it 'saves a password recovery token time when we generate a token' do
      Timecop.freeze do
        user.generate_token
        expect(user.password_token_time).to eq Time.now
      end
    end

    it 'can find a user with a valid token' do
      user.generate_token
      expect(User.find_by_valid_token(user.password_token)).to eq user
    end

    it "doesn't return a user if a token has expired" do
      user.generate_token
      Timecop.travel(60 * 60 + 1) do
        expect(User.find_by_valid_token(user.password_token)).to eq nil
      end
    end
  end
end
