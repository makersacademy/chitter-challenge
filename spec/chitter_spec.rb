require './lib/chitters'

describe Chitters do
    describe '#Add peep' do
      it 'Adds new peeps' do
        Chitters.addpeep('test peep')
        peeps = Chitters.view_peeps
        expect(peeps[0]).to include 'test peep'
        # expect(peeps[1]).to include (Time.now.to_s)
        expect(peeps[1]).to be_within(1.second).of Time.now   #  .to include (Time.now.to_s)
      end
    end

    describe '#view_peeps' do
      it 'can view peeps' do
        Chitters.addpeep("test peep")
        # connection = PG.connect(dbname: 'test_chitter')
        # connection.exec("INSERT INTO chitter (peep) VALUES ('test peep');")
        peeps = Chitters.view_peeps
        expect(peeps[0]).to include('test peep')
      end
    end
end