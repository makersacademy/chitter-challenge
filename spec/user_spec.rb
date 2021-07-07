require 'user'
require_relative 'database_helpers'

describe User do

  it 'create a new user' do
      the_peeper = User.add_user(name: 'John Smith', email: 'johnsmith@makers.com', username: 'johnsmithsmooth', password: 'password1234')
      persisted_data = persisted_data(table: 'user', id: the_peeper.id)

      expect(the_peeper.username).to eq 'johnsmithsmooth'
  end
end