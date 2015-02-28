require 'spec_helper'

describe Peep do

  context 'Checking Datamapper is working' do

    time = DateTime.now
    date = Date.today

    it 'should be created and then retrieved from the db' do
      #expect(Peep.count).to eq(0)
      Peep.create(content: "This is the first chitter peep",
                  created_at: time,
                  created_on: date)
      #expect(Peep.count).to eq(1)
      peep = Peep.first
      expect(peep.created_at).to eq(time)
      expect(peep.created_on).to eq(date)
      peep.destroy
      expect(Peep.count).to eq(0)
    end
  end
end