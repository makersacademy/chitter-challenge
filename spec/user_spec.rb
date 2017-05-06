describe User do

  it { is_expected.to respond_to :real_name }
  describe '#create' do
    it 'saves user to database' do
      user = User.create(email_address: 'james@aol.com',
                         password: 'password',
                         user_name: 'james',
                         real_name: 'James Giant')
      user_id = user.id
      expect(User.first(id: user_id)).to eq user
    end
  end

end
