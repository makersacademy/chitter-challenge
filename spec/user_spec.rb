describe User do
  user = User.create(username: 'Lolo', email:'laurent@hotmail.com', name: 'Laurent Bo', password: '1234')
    it "takes a string as a username" do
      expect(user.username).to be_a_kind_of String
    end
end
