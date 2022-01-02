require 'peep.rb'
require 'database_helpers.rb'

describe Peep do
  describe '.post' do
    it 'makes a new entry in the peeps table of the DB' do
      user_id = 1
      peep_body = "Hello Chitter!"

      Peep.post(user_id, peep_body)
      query_hash = persisted_data(table: "peeps", id: user_id)

      expect(query_hash["user_id"]).to eq user_id.to_s
      expect(query_hash["body"]).to eq peep_body
    end
  end

  describe '.all' do
    it 'returns an array of Peep instances' do
      add_five_peeps_to_DB()

      expect(described_class.all).to be_instance_of(Array)
      expect(described_class.all).to include(described_class)
    end
  end
end