require 'user'

describe User do

  describe '#all_users' do
    it 'Returns all users from the database' do
      users = User.all_users
      expect(users[0]).to be_a User
      expect(users[0].u_name).to eq "defaultuser"
      expect(users[0].email).to eq "testemail@gmail.com"
    end
  end

  describe '#add_user' do
    it 'Adds a user to a database' do
      User.add("testingusername", "test2.gmail.com", "password2")
      users = User.all_users
      expect(users[1]).to be_a User
      expect(users[1].u_name).to eq "testingusername"
      expect(users[1].email).to eq "test2.gmail.com"
    end
  end

  describe '#Login' do
    describe '#sign_in_check' do
      it 'Returns true if email and password exists in database' do
        expect(User.sign_in_check('testemail@gmail.com', 'password')).to eq true
      end
      it 'Returns false if email exists in database but password doesnt' do
        expect(User.sign_in_check('testemail@gmail.com', 'password1')).to eq false
      end
      it 'Returns false if email doesnt exist in database but password does' do
        expect(User.sign_in_check('testemail123@gmail.com', 'password')).to eq false
      end
      it 'Returns if new user signs up and then signs in with correct details' do
        User.add("testingusername", "test2.gmail.com", "password2")
        expect(User.sign_in_check("test2.gmail.com", "password2")).to eq true
      end
    end
  end
end
