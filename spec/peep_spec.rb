require 'spec_helper'

describe Peep do

  context 'Checking Datamapper is working' do

    date= DateTime.now

    it 'should be created and then retrieved from the database' do
      Peep.create(content: "This is the first chitter peep",
                  created_at: date)
      peep = Peep.first
      expect(peep.content).to eq "This is the first chitter peep"
      peep.destroy
      expect(Peep.count).to eq(0)
    end
  end
end