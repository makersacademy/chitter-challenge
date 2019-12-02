require './lib/chitter'
require 'pg'

describe Chitters do
  describe '.all' do
    it 'returns a list of chitters' do
      connection = PG.connect(dbname: 'chitter_manager_test')
      peeps = Chitters.all
    end
  end
end
