describe User do
  describe "#register" do
      
    it "registers an user" do
      user = User.create
      is_register = user.register(username: "test_user", email: "test_user@example.com", first_name: "lorem", last_name: "ipsum", password: "password")
      expect(is_register).to be true
    end

    it "does not register" do
      user_1 = User.create
      user_2 = User.create
      is_register_1 = user_1.register(username: "test_user", email: "test_user@example.com", first_name: "lorem", last_name: "ipsum", password: "password")
      is_register_2 = user_2.register(username: "test_user", email: "test_user@example.com", first_name: "lorem", last_name: "ipsum", password: "password")

      expect(is_register_2).to be false
    end
  end
  describe "#sign_in" do
    it "signs in a user" do
      user = User.create
      is_register = user.register(username: "test_user", email: "test_user@example.com", first_name: "lorem", last_name: "ipsum", password: "password")
      is_logged = user.sign_in(username: "test_user", password: 'password')
      puts is_logged
      expect(is_logged).to be true
    end
    it "does not sign in a user" do
      user = User.create
      is_register = user.register(username: "test_user_1", email: "test_user@example.com", first_name: "lorem", last_name: "ipsum", password: "password")
      is_logged = user.sign_in(username: "test_user", password: 'password')
      puts is_logged
      expect(is_logged).to be false
    end
  end

end
