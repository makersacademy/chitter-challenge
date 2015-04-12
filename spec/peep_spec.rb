require 'spec_helper'

describe Peep do
  
  context 'Demonstration of how datamapper works for peeps' do

    it 'should be created and then retrieved from the db' do
      User.create(  id: 1,
                    email: 'phoebe@phoebeh.com',
                    username: 'phoebe')
      expect(Peep.count).to eq(0)
      Peep.create(  text: 'This is my first Peep',
                    user_id: 1)
      expect(Peep.count).to eq(1)
      peep = Peep.first
      expect(peep.text).to eq('This is my first Peep')
    end

  end
end
