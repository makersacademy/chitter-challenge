require './lib/chitter'
require 'pg'

describe Chitters do

  describe '.all' do
    it 'returns a list of chitters' do
      connection = PG.connect(dbname: 'chitter_manager_test')
      peeps = Chitters.all
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Chitters.create(user_name: 'user', peep: 'This is a test peep')
      expect(Chitters.all).to include 'This is a test peep'
    end
  end

end
