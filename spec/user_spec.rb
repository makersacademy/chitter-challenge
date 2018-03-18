describe User do

  describe '#login' do
    it 'expects to return 0 when wrong login details entered' do
      expect(User.login('invalid_user_name', 'or_wrong_password')).to eq(0)
    end

    it 'expects to return >0 when valid login details entered' do
      result = User.login('johndoe', 'johndoe')
      expect(result).not_to be <= 0
      expect(result).to be > 0

    end
  end

  describe '#delete' do
    it 'should not delete the user from db if wrong password given' do
      User.delete('rspec', 'wrong_password')
      expect(User.login('rspec', 'rspec')).to be >0 # proves that user was added to db
    end

    it 'expects to delete user from user table' do
      User.delete('rspec', 'rspec')
      expect(User.login('rspec','rspec')).to be(0) # proves that user was added to db
    end

  end

  describe '#add' do
    it 'should add the user in users table' do
      User.add('rspec', 'rspec', 'RSpec', 'Rspec Surname', 'rspec@ruby.com')
      expect(User.login('rspec', 'rspec')).to be > 0
    end

    it 'should return false if username already exists' do
      expect(User.add('rspec', 'rspec', 'RSpec', 'Rspec Surname', 'rspec@ruby.com')).to eq(false)
    end

    it 'should return false if email already has an account' do
      expect(User.add('rspec_diff', 'rspec_diff', 'RSpec new', 'Rspec Surname new', 'rspec@ruby.com')).to eq(false)
    end
  end
end
