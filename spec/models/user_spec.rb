describe User do

  let!(:user) do
    User.create(first_name: "Alan",
                last_name: "Shearer",
                username: "alan123",
                email: "alan@nufc.com",
                password: "password123",
                password_confirmation: "password123")
              end

  describe '#authenticate' do
    it 'authenticates a vaild email and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end
  end

end
