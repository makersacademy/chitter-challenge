describe User do

  let(:test_user) { User.create(name: "Rafi", user_name: "SuperRafi", email: "rafi@superwoman.com", password: "myPassword123" )}

  describe '#authenticate' do

    it 'should return a user if the login credentials are valid' do
      logged_in_user = User.authenticate(test_user.email, test_user.password)
      expect(logged_in_user).to eq test_user
    end

    it 'should return nil if the login credentials are invalid' do
      logged_in_user = User.authenticate(test_user.email, "hellohello")
      expect(logged_in_user).to eq nil
    end


  end


end
