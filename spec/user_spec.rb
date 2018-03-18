describe User do

  describe '#login' do
    it 'expects to return false when wrong login details entered' do
      expect(User.login('invalid_user_name', 'or_wrong_password')). to eq(false)
    end

    it 'expects to return true when valid login details entered' do
      expect(User.login('johndoe', 'johndoe')). to eq(true)
    end
  end

  describe '#delete' do
    it 'should not delete the user from db if wrong password given' do
      User.delete('rspec', 'wrong_password')
      expect(User.login('rspec', 'rspec')).to eq(true) # proves that user was added to db
    end

    it 'expects to delete user from user table' do
      User.delete('rspec', 'rspec')
      expect(User.exists?('rspec')).to eq(false) # proves that user was added to db
    end

  end

  describe '#add' do
    it 'should add the user in users table' do
      User.add('rspec', 'rspec', 'RSpec', 'Rspec Surname', 'rspec@ruby.com')
      expect(User.exists?('rspec')).to eq(true)
    end

    it 'should return false if username already exists' do
      expect(User.add('rspec', 'rspec', 'RSpec', 'Rspec Surname', 'rspec@ruby.com')).to eq(false)
    end

    it 'should return false if email already has an account' do
      expect(User.add('rspec_diff', 'rspec_diff', 'RSpec new', 'Rspec Surname new', 'rspec@ruby.com')).to eq(false)
    end
  end
end
