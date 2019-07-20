require './models/peep'

describe Peep do

  describe '#.all' do
    it 'returns all peeps' do

    connection = PG.connect(dbname: 'peep_manager_test')
    # add the test data
    connection.exec("INSERT INTO peeps (peep, time) VALUES('hello', '#{Time.now}');")
    connection.exec("INSERT INTO peeps (peep, time) VALUES('mike', '#{Time.now}');")
    peeps = Peep.all
    
    # will need to update these tests later to include time and other data types etc.
    expect(peeps.length).to eq 3
    expect(peeps.first).to be_a Peep
    expect(peeps.last.peep).to eq "mike"
    end
  end

  describe '#.post' do
    it 'allows you to post a new peep to chitter' do
      expect(Peep.add("first peep!", 'richieganney')).to be_a Peep
    end
  end
end
  