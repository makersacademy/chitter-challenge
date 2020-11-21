require 'peeps'

describe Peeps do
  let(:peeps) {Peeps.new(id: "1", username: "usernametest", peep: "peeptest", lastmodified: "lastmodifiedtest")}

  describe '#initialize' do
    it 'Is an instance of Peep' do
      expect(peeps).to be_a Peeps
    end

    it "Instances respond to the .id method" do
      expect(peeps.id).to eq "1"
    end

    it "Instances respond to the .username method" do
      expect(peeps.username).to eq "usernametest"
    end

    it "Instances respond to the .peep method" do
      expect(peeps.peep).to eq "peeptest"
    end

    it "Instances respond to the .lastmodified method" do
      expect(peeps.lastmodified).to eq "lastmodifiedtest"
    end
  end

  describe '.all' do
    it 'Returns a ruby object containing information from the SQL database' do
    
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (username, peep) VALUES ('rorschach12', 'I am not sure if I am qualified to be doing this')")
      connection.exec("INSERT INTO peeps (username, peep) VALUES ('SlowSally123', 'SQL is quite hard eh?!')")
      connection.exec("INSERT INTO peeps (username, peep) VALUES ('AndyH21', 'Why. Just why.')")

      peeps = Peeps.all

      expect(peeps[0].username).to eq "rorschach12"
      expect(peeps[0].peep).to eq "I am not sure if I am qualified to be doing this"
      # expect(peeps[0].lastmodified).to eq Time.now
      expect(peeps.length).to eq 3
    end
  end


end