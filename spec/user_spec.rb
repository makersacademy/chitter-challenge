require 'user'

describe User do

  describe '#all_users' do
    it 'Returns all users from the database' do
      users = User.all_users
      expect(users[0]).to be_a User
      expect(users[0].email).to eq "testemail@gmail.com"
      expect(users[0].password).to eq "password"
    end
  end

  describe '#add_user' do
    it 'Adds a user to a database' do
      User.add("test2.gmail.com", "password2")
      users = User.all_users
      expect(users[1]).to be_a User
      expect(users[1].email).to eq "test2.gmail.com"
      expect(users[1].password).to eq "password2"
    end
  end

  describe '#Login' do
    describe '#sign_in_check' do
      it 'Returns true if email and password exists in database' do
        User.sign_in('testemail@gmail.com', 'password')
        expect(User.sign_in_check('testemail@gmail.com', 'password')).to eq true
      end
      it 'Returns false if email exists in database but password doesnt' do
        User.sign_in('testemail@gmail.com', 'password1')
        expect(User.sign_in_check('testemail@gmail.com', 'password1')).to eq false
      end
      it 'Returns false if email doesnt exist in database but password does' do
        User.sign_in('testemail123@gmail.com', 'password')
        expect(User.sign_in_check('testemail123@gmail.com', 'password')).to eq false
      end
      it 'Returns if new user signs up and then signs in with correct details' do
        User.add("test2.gmail.com", "password2")
        User.sign_in("test2.gmail.com", "password2")
        expect(User.sign_in_check("test2.gmail.com", "password2")).to eq true
      end
    end
  end
end
