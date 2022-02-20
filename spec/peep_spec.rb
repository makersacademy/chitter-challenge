require 'peep'
require_relative 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peep messages' do
      connection = PG.connect(dbname: 'chitter_test')

      test_post = Peep.create(peep_content: "test peep", time_posted: "now")
      Peep.create(peep_content: "second peep", time_posted: "now")
      Peep.create(peep_content: "thrid peep", time_posted: "now")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      p peeps
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq test_post.id
      expect(peeps.first.peep_content).to eq "test peep"
    end
  end
end
