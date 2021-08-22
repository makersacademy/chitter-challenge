require 'user'

describe User do

  describe '.create' do
  
    it 'creates a new user object with required parameters' do
      user = User.create('Ed', 'Ed209', 'password1', 'ed@genericemail.com')
      expect(user.name).to eq 'Ed'
      expect(user.handle).to eq '@Ed209'
      expect(user.email).to eq 'ed@genericemail.com'
    end

    it 'encrypts the password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password1')
      User.create('Ed', 'Ed209', 'password1', 'ed@genericemail.com')
    end
  end

  describe '.all' do
    it 'generates an array of user objects' do
      User.create('Ed', 'Ed209', 'password1', 'ed@genericemail.com')
      User.create('Prune', 'Pruney', 'password2', 'pd@genericemail.com')        
      User.create('Maureen', 'MHaaks', 'password3', 'mh@genericemail.com')
        
      users = User.all
  
      expect(users.length).to eq 3
      expect(users.first.name).to eq 'Ed'
      expect(users[1].handle).to eq '@Pruney'        
      expect(users.last.email).to eq 'mh@genericemail.com'
    end
  end

  describe '.check_if_unique_user' do
    it 'creates a user if both handle and email are unique' do
      expect(User.check_if_unique('Ed', 'Ed209', 'password1', 'ed@genericemail.com')).to be_a User
    end

    it 'sets error flag as nil if both handle and email are unique' do
      User.check_if_unique('Ed', 'Ed209', 'password1', 'ed@genericemail.com')
      expect(User.error).to be nil
    end
    
    it 'sets error variable if email is not unique' do
      User.create('Ed', 'Ed209', 'password1', 'ed@genericemail.com')
      User.check_if_unique('Ed', 'Edd', 'password1', 'ed@genericemail.com')
      expect(User.error).to eq :email
    end

    it 'sets error variable if handle is not unique' do
      User.create('Ed', 'Ed209', 'password1', 'ed@genericemail.com')
      User.check_if_unique('Ed', 'Ed209', 'password1', 'ed@anotheremail.com')
      expect(User.error).to eq :handle
    end
  end

end
