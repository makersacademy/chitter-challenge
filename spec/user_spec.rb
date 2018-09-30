require 'user'

describe User do
  describe '.add' do
    it 'adds a user to the database' do
      expect { User.add('Test', 'test@test.com') }.to_not raise_error
    end
  end
end