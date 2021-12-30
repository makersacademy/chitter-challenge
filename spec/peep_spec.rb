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
end