require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'peeps_test')

      Peep.create(content: "This is the first peep", name: 'testname', username: 'testusername')
      Peep.create(content: "This is the second peep", name: 'testname', username: 'testusername')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      # expect(peeps.first).to be_a Peep
      # need some more tests here later
    end
  end

  describe '.create' do
    it  'creates a new peep' do

      Peep.create(content: 'This is a test peep', name: 'testname', username: 'testusername')

      peeps = Peep.all
      peepss = peeps.map { |peep| peep}
      expect(peepss[0]['content']).to eq 'This is a test peep'
      # connection = PG.connect(dbname: 'peeps')
      # peep = Peep.create(content: "This is the first peep")
      #
      # persisted_data = persisted_data(content: 'content', table: 'peeps')
      #
      # # expect(page.all(‘li’)[0].text).to eq “peep2”
      #
      #       expect(peep.content).to eq persisted_data.first['content']

    end
  end
end
