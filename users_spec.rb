require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      User.create('kirt', 'password123')
    end
  end
end
