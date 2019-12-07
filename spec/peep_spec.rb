require 'peep'

describe Peep do
  describe '#all' do
    it "should return a list peeps" do
      connection = PG.connect(dbname: 'peeps_test')
      result = connection.exec("INSERT INTO messages(text) VALUES('first message');")

      peeps = Peep.all

      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'first message'
    end
  end

end