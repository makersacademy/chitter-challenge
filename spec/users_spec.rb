require 'user'

describe User do

  it 'should store id and email' do
    user = User.new(id: 1, email: 'abdi@gmail.com')

    expect(user.id).to eq 1
    expect(user.email).to eq 'abdi@gmail.com'
  end

  describe '.create' do
    it 'should store new user into databse' do
      user_info = {'id' => 1, 'first_name' => 'abdi', 'last_name' => 'abdi','email' => 'abdi2@gmail.com', 'password' => 'password123'}    
      user = User.create(user_info)

      expect(user.email).to eq 'abdi2@gmail.com'
    end

    it 'hashes the password using BCrypt' do
      user_info = {'id' => 1, 'first_name' => 'abdi', 'last_name' => 'abdi','email' => 'abdi2@gmail.com', 'password' => 'password123'}
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(user_info)
    end
  end

end
