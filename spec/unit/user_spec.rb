require 'user'

describe User do
  context '#sign_up' do
    it 'able to save user' do
      user = User.sign_up(name: 'Frodo', email: 'frodo@email.com', password: 'password')
      
      user.each do |user|
        expect(user['user_name']).to eq 'Frodo'
        expect(user['email']).to eq 'frodo@email.com'
        expect(user['user_password']).to eq 'password'
      end
    end
  end

  context '#sign_in' do
    it 'should be able to sign in' do
      User.sign_up(name: 'Frodo', email: 'frodo@email.com', password: 'password')
      user = User.log_in?(email: 'frodo@email.com', password: 'password')
      
      expect(user).to eq true
    end

    it 'should validate user if not exist' do
      User.sign_up(name: 'Sam', email: 'sam@email.com', password: 'password')
      user = User.log_in?(email: 'sam@email.com', password: '123')
      
      expect(user).to eq false
    end
  end

end