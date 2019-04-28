require 'peep'
require 'database_connection'

RSpec.describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      DatabaseConnection.setup('chitter_test')

      Peep.post(peep: "hello")
      peeps = Post.all

      expect(peeps).to include "hello"
    end
  end

end
