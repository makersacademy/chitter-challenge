describe User do
  let(:create_user) { User.create(username: 'tomd', email: ENV['MY_EMAIL'], password: 'password', name: 'Tom')}
  describe '#create' do
    it "doesn't allow duplicate usernames / emails to be entered" do
      User.create(username: 'tomd', email: ENV['MY_EMAIL'], password: 'password', name: 'Tom')
      User.create(username: 'tomd', email: ENV['MY_EMAIL'], password: 'password', name: 'Tom')
      expect(User.all[-2]).to eq nil
    end
  end
  describe '#all' do
    it 'returns array of user instances' do
      create_user
      first_user = User.all[0]
      expect(first_user).to be_a(User)
      expect(first_user.username).to eq 'tomd'
      expect(first_user.email).to eq ENV['MY_EMAIL']
      expect(first_user.password).to eq 'password'
      expect(first_user.name).to eq 'Tom'
    end
  end
end
