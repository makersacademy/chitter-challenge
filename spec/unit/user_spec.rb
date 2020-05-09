require 'user'

describe User do
  context '#log_out' do
    it 'able to save user' do
      user = User.sign_up(name: 'Frodo', email: 'frodo@email.com', password: 'password')
      
      user.each do |user|
        expect(user['user_name']).to eq 'Frodo'
        expect(user['email']).to eq 'frodo@email.com'
        expect(user['user_password']).to eq 'password'
      end
    end
  end

end