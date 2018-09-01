describe User do

  describe '.signup' do
    it 'returns the username' do
      info = {"name"=>"Dave", "email"=>"dave@dave.com", "password"=>"pw123", "username"=>"dave123"}
      username = User.signup(info)
      expect(username).to eq "dave123"
    end
  end
end
