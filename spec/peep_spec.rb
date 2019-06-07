require './lib/peep.rb'

describe Peep do
  let(:peep) { Peep.new("Name", "Some content", "01-01-2019") }

  context '.new' do
      it 'creates a new peep with a name' do
        expect(peep.name).to eq("Name")
      end

      it 'creates a new peep with content' do
        expect(peep.content).to eq("Some content")
      end

      it 'creates a new peep with a timestamp' do
        expect(peep.time_stamp).to eq("01-01-2019")
      end
    end

  context '.create' do
    it 'creates a new peep' do
      peep.create
      peeps = Peep.all

      expect(peeps).to satisfy{ |result| result.any? { |peep|
        peep.name == "Name" && peep.content == "Some content" }
       }
    end
  end

  context '.all' do
    it 'displays all peeps' do
      expect(Peep.all).to satisfy{ |result| result.any? { |peep|
        peep.instance_of? Peep } }
    end
  end
end
