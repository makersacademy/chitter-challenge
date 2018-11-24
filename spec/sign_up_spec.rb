describe Users do
  describe '.create' do
    it 'creates a new user' do
      user = Users.create(username: 'leoncross', email: 'leon@email.com', password: 'leonpass', name: 'leon')
      expect(user).to be_a Users
      expect(user.username).to eq 'leoncross'
      expect(user.email).to eq 'leon@email.com'
      expect(user.password).to eq 'leonpass'
      expect(user.name).to eq 'leon'
    end
  end
end
