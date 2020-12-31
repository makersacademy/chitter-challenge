describe User do
  describe '.check_duplicate' do
    test_user = {
      name: "User",
      email: "Email",
      username: "Username",
      password: "password"
    }
    it 'identifies a duplication of username' do
      User.create(test_user)

      user2 = User.new(
        name: "User2",
        email: "Email2",
        username: "Username",
        password: "password"
      )

      expect(User.check_duplicate(user2)).to eq 'That username is already taken!'
    end

    it 'identifies a duplication of email' do
      User.create(test_user)

      user2 = User.new(
        name: "User2",
        email: "Email",
        username: "Username2",
        password: "password"
      )

      expect(User.check_duplicate(user2)).to eq 'That email address is already registered.'
    end
  end
end
