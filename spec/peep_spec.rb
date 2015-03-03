require 'spec_helper'

describe Peep do

  context 'Demonstration of how datamapper works' do

    it 'should be created and then retrieved from the database' do
      expect(Peep.count).to eq(0)
      Peep.create(user: 'Lorisfo',
                  message: 'This is my first chitter peep!')
      expect(Peep.count).to eq(1)
      link = Peep.first
      expect(link.message).to eq('This is my first chitter peep!')
      expect(link.user).to eq('Lorisfo')
      link.destroy
      expect(Peep.count).to eq(0)
    end

  end

end