describe User do
  let(:user) do
    User.create(name: 'Samuel Russell Hampden Joseph',
                username: 'tansaku',
                email: 'sam@makersacademy.com',
                password: 's3cr3t',
                password_confirmation: 's3cr3t')
  end

  describe '.authenticate' do
    context 'when given a valid email address and password' do
      it 'authenticates' do
        authenticated_user = User.authenticate(user.email, user.password)
        expect(authenticated_user).to eq user
      end
    end

    context 'when given an incorrect password' do
      it 'does not authenticate' do
        expect(User.authenticate(user.email, 'wrong')).to be_nil
      end
    end
  end
end