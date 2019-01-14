describe 'User' do
  describe '.auth' do
    let!(:user) { User.create(username: 'test1', mail: 'test@mail.com', password: '123')}
    it 'will return user if user exits' do
      expect(User.auth('test1', '123')).to eq user
    end
  end
end
