require 'user'

describe User do

  let(:user_info) { {'first_name' => 'abdi', 'last_name' => 'abdi','email' => 'abdi2@gmail.com', 'password' => 'password123'} }

  it 'should store id and email' do
    user = User.new(id: 1, email: 'abdi@gmail.com')

    expect(user.id).to eq 1
    expect(user.email).to eq 'abdi@gmail.com'
  end

  describe '.create' do
    it 'should store new user into databse' do    
      user = User.create(user_info)

      expect(user.email).to eq 'abdi2@gmail.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      
      User.create(user_info)
    end
  end

  describe '.find' do
    it 'should find user from database with matching id' do    
      created_user = User.create(user_info)
      found_user_email = User.find(created_user.id)[0].email
      expect(found_user_email).to eq user_info['email']
    end
  end

end
