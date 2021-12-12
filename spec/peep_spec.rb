require 'peep'

describe Peep do
  describe '.all' do
    it "returns all the Peeps in reverse chronological order" do

      Peep.create(content: 'My first Peep')
      Peep.create(content: 'My second Peep')
      peep = PG.connect(dbname: 'chitter_app_test').query("INSERT INTO peeps (content) VALUES ('#{'My Third Peep'}') RETURNING id, content, created_at;")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps).to be_a Array
      # expect(peep.first.id).to eq peep.id
      expect(peeps).to ('My first Peep')
      # expect(peep.created_at).to eq peep.created_at
    end
  end

  describe '.create' do
    it 'creates a Peep' do
      peep = Peep.create(content: 'My fourth Peep')
      persisted_time_data = PG.connect(dbname: 'chitter_app_test').query("SELECT * FROM peeps WHERE created_at = #{peep.created_at};")

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_time_data['created_at']
      expect(peep.content).to eq 'My fourth Peep'
    end
  end
end
