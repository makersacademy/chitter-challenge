require 'spec_helper'

describe Peep do

  context 'Demonstration of how datamapper works' do

    it 'Should be created and then deleted from the database' do
      expect(Peep.count).to eq(0)
      Peep.create(user_name: 'klanzon',
                  post: 'this is my first peep!',
                  name: 'Kevin Lanzon')
      expect(Peep.count).to eq(1)
      peep = Peep.first
      expect(peep.user_name).to eq('klanzon')
      expect(peep.post).to eq('this is my first peep!')
      expect(peep.name).to eq('Kevin Lanzon')
      peep.destroy
      expect(Peep.count).to eq(0)
    end
  end

end
