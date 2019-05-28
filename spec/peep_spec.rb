require 'pg'
require 'peep'

describe Peep do
  subject(:peep) { described_class.new(name: "Lisa", username: "@lisa", peep: "My first peep!", time: "2019-05-27 13:13:33 +0100") }

  describe '.name' do
    it 'returns the user\'s name' do
      expect(peep.name).to eq "Lisa"
    end
  end

  describe '.username' do
    it 'returns the user\'s name' do
      expect(peep.username).to eq "@lisa"
    end
  end

  describe '.peep' do
    it 'returns the user\'s name' do
      expect(peep.peep).to eq "My first peep!"
    end
  end

  describe '.time' do
    it 'returns the user\'s name' do
      expect(peep.time).to eq "2019-05-27 13:13:33 +0100"
    end
  end

  describe '#add' do
    it 'adds a peep to the database' do
      peep = Peep.new(name: "Lisa", username: "@lisa", peep: "My first peep!", time: "2019-05-27 13:13:33 +0100")
      peep.add
      con = PG.connect(dbname: 'chitter_test')
      result = con.query("SELECT DISTINCT name, username, peep, time FROM peeps;")
      result.map do |peep|
        Peep.new(name: result[0]['name'], username: result[0]['username'], peep: result[0]['peep'], time: result[0]['time'])
      end
      expect(result[0]).to eq "name"=>"Lisa", "username"=>"@lisa", "peep"=>"My first peep!", "time"=>"2019-05-27 13:13:33 +0100"
    end
  end

  describe ".all" do
    it 'returns all peeps' do
      con = PG.connect(dbname: 'chitter_test')

      peep1 = Peep.new(name: "Lisa", username: "@lisa", peep: "My first peep!", time: "2019-05-27 13:13:33 +0100")
      peep2 = Peep.new(name: "Lisa", username: "@lisa", peep:"My second peep!", time:"2019-05-27 13:13:33 +0100")
      peep1.add
      peep2.add
	    peeps = Peep.all


	    expect(peeps.length).to eq 2
	    expect(peeps.first).to be_a Peep
	    expect(peeps.first.name).to eq peep.name
	    expect(peeps.first.username).to eq '@lisa'
	    expect(peeps.first.peep).to eq 'My second peep!'
	  end
  end
end
