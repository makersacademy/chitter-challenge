require 'peep'

describe Peep do

  describe '.all' do
    it "returns a list of all peeps" do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (user_name, time_stamp, text)
                      VALUES ('darryl', 'NOW()', 'blah, blah, blah');")
      connection.exec("INSERT INTO peeps (user_name, time_stamp, text)
                      VALUES ('tiffany', 'NOW()', 'blah, blah, test');")

      peeps = Peep.all
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep

    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(user_name: 'darryl', time_stamp: 'NOW()',
                          text: 'this is a peep')

      expect(peep).to be_a Peep
      expect(peep.user_name).to eq 'darryl'
      expect(peep.text).to eq 'this is a peep'
    end
  end

end
