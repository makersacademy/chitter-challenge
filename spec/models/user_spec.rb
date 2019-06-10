describe User do
  let(:user) { User.new(id: 1, username: "Bird brains", password: "12345") }
  
  it 'has a username' do
    expect(user.username).to eq("Bird brains")
  end
  it 'has a password' do
    expect(user.password).to eq('12345')
  end
  it 'has an id' do
    expect(user.id).to be 1
  end

  describe '.create' do
    it 'requires username to be unique' do
      User.create(username: 'Crow', password: 'abcd')
      User.create(username: 'Crow', password: 'defg')
      expect(User.all({ username: 'Crow' }).length).to be 1
    end
  end
end
  # describe '.check_login' do
  #   before (:each) do
  #     Peep.destroy
  #     User.destroy
  #     create_peeps
  #     create_users
  #   end

  #   scenario 'correct username and password' do
  #     it ''
  #   end

  #   scenario 'user does not exist'

  #   scenario 'user exists, incorrect password'
  # end
# end
