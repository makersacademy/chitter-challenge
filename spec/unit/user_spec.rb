require 'user'

describe User do
  
  describe '.create' do
  
    it 'creates a new user object with required parameters' do
      user = User.create('Ed', 'Ed209', 'password1', 'ed@genericemail.com')
      expect(user.name).to eq 'Ed'
      expect(user.handle).to eq '@Ed209'
      expect(user.password).to eq 'password1'
      expect(user.email).to eq 'ed@genericemail.com'
    end
  end

end
