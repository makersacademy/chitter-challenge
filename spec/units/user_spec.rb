describe User do
  describe '.all' do
    it 'returns empty array on creation' do
      expect(User.all).to be_empty
    end
  end

  describe '.add' do
    it 'stores an entry of user details' do
      a = User.add(name: "James", user: "js", email: "example@example.com", password: "p123")
      expect(User.all).to include(a)
      expect(a.id).to eq(1)
      expect(a.name).to eq("James")
      expect(a.user).to eq("js")
      expect(a.email).to eq("example@example.com")
      expect(a.password).to eq("p123")
    end

    it 'does not store if email not unique' do
      User.add(name: "James", user: "js", email: "example@example.com", password: "p123")
      User.add(name: "Adam", user: "af", email: "example@example.com", password: "p456")
      expect(User.all.size).to eq(1)
    end

    it 'does not store if user not unique' do
      User.add(name: "James", user: "js", email: "example@example.com", password: "p123")
      User.add(name: "John", user: "js", email: "example123@example.com", password: "p456")
      expect(User.all.size).to eq(1)
    end
  end

  describe '.instance - singleton pattern' do
    it 'is nil before logging in' do
      expect(User.instance).to eq(nil)
    end
  end

  describe '.login' do
    it '.instance returns nil if username not found' do
      User.login("js", "p123")
      expect(User.instance).to eq(nil)
    end

    it '.instance returns nil if password is wrong' do
      User.add(name: "James", user: "js", email: "example@example.com", password: "p123")
      User.login("js", "p456")
      expect(User.instance).to eq(nil)
    end

    it '.instance returns user instance if password correct' do
      a = User.add(name: "James", user: "js", email: "example@example.com", password: "p123")
      User.login("js", "p123")
      expect(User.instance).to eq(a)
    end
  end

  describe '.logout' do
    it 'sets .instance to nil' do
      a = User.add(name: "James", user: "js", email: "example@example.com", password: "p123")
      User.login("js", "p123")
      expect(User.instance).to eq(a)
      User.logout
      expect(User.instance).to eq(nil)
    end
  end
end
