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
    describe '#email_check' do
        it 'Returns true if email exits in database' do
          User.sign_in('testemail@gmail.com', 'password')
          expect(User.email_check('testemail@gmail.com')).to eq true
        end
      end

    describe '#password_check' do
        it 'Returns true if password exits in database' do
          User.sign_in('testemail@gmail.com', 'password')
          expect(User.password_check('password')).to eq true
        end
      end

    describe '#sign_in_checks' do
      it 'Returns true if password and username exists in database' do
        User.sign_in('testemail@gmail.com', 'password')
        expect(User.sign_in_check('testemail@gmail.com', 'password')).to eq true
      end
    end
    end
  end
