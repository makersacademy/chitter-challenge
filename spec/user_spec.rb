require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(first_name: 'Jay', last_name: 'Khan', date: '2018-07-08 00:00:00')

      expect(user.id).to_not be nil
    end

    it 'returns the first and last name of the user' do
      user = User.create(first_name: 'Jay', last_name: 'Khan', date: '2018-07-08 00:00:00')

      expect(user.first_name).to eq 'Jay'
      expect(user.last_name).to eq 'Khan'
    end
  end
end
