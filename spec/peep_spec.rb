require 'spec_helper'

describe Peep do

  context 'testing that rspec is working' do

    it 'should be able to create a message and then delete it' do
      expect(Peep.count).to eq(0)
      Peep.create(message: 'Hello World!')
      expect(Peep.count).to eq(1)
      peep = Peep.first
      expect(peep.message).to eq('Hello World!')
      peep.destroy
      expect(Peep.count).to eq(0)
    end
  end
end