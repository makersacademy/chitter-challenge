require './lib/chitters'
require 'time'
require 'date'
#require 'active_support/time'

describe Chitters do
    describe '#Add peep' do
      it 'Adds new peeps' do
        Chitters.addpeep('test peep')
        peeps = Chitters.view_peeps
        expect(peeps[0]).to include 'test peep'
        # expect(peeps[1]).to include (Time.now.to_s)
        a = peeps.last[0]
        expect(a).to be_within(2.seconds).of(Time.now.to_s)    #  .to include (Time.now.to_s)
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