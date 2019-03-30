require 'user'
describe User do

  describe 'create a User' do
    it 'when sending the create message to Peep class' do
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      expect(user.name).to eq 'My_name'
      expect(user.username).to eq 'My_username'
      expect(user.email).to eq 'myname@gmail.com'
      expect(user.password).to eq 'some_password'
    end
  end

end