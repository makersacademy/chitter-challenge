require './lib/chitters'

describe Chitters do
    describe '#Add peep' do
      it 'Adds new peeps' do
        Chitters.addpeep('test peep')
        peeps = Chitters.view_peeps
        expect(peeps).to include 'test peep'
      end
    end

    describe '#view_peeps' do
      it 'can view peeps' do
        Chitters.addpeep("test peep")
        # connection = PG.connect(dbname: 'test_chitter')
        # connection.exec("INSERT INTO chitter (peep) VALUES ('test peep');")
        peeps = Chitters.view_peeps
        expect(peeps).to include('test peep')
      end
    end
end