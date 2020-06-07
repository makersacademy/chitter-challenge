require 'user'
require_relative 'database_helpers'

describe User do

  it 'create a new user' do
      the_peeper = User.add_user(name: 'Elon Musk', email: 'elonmusk@space.com', username: 'elonmusk69', password: 'tesla123')
      persisted_data = persisted_data(table: 'user', id: the_peeper.id)

      expect(the_peeper.username).to eq 'elonmusk69'
  end
end
