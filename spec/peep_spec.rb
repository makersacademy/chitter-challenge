require 'spec_helper'

describe Peep do 

  context 'Checking that datamapper works' do 
    it 'should be created and then retrieved from the db' do 
      expect(Peep.count).to eq(0)
      Peep.create(message: 'my first peep!')
      expect(Peep.count).to eq(1)
      peep = Peep.first
      expect(peep.message).to eq('my first peep!')
      peep.destroy
      expect(Peep.count).to eq(0)
    end
  end
end