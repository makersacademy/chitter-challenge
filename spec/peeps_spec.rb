require 'peeps'


describe Peeps do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      peep = Peeps.create(text: "This is the first Peep")
      Peeps.create(text: "This is the second Peep")
      Peeps.create(text: "This is another Peep")


      peeps = Peeps.all

      expect(peeps.length).to eq 3

    end
  end
end
