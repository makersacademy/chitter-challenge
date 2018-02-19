require 'user'

describe User do

  describe '.all' do
    it 'returns all users, wrapped in user instances' do
      users = User.all
      usernames = users.map(&:username)
      expect(usernames).to include('@heather')
    end
  end
  #
  # describe '.add' do
  #   it 'saves a new user to chitter' do
  #     User.add()
  #     feed = Peep.all
  #     peeps = feed.map(&:message)
  #     expect(peeps).to include('A new peep!')
  #   end
  # end

end
