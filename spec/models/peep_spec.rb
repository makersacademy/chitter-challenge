require 'peep'
require_relative '../../data_mapper_setup.rb'

describe Peep do
  before(:each) do
    Peep.destroy
    create_peeps
    
  end
  describe '.all' do
    it 'returns an array of peeps' do
      expect(Peep.all).to satisfy { |array| array.all?(Peep) }
    end

    it 'returns peeps with the test text' do
      expect(Peep.all[0].text).to eq('First ever peep!!!!')
    end

    it 'returns peeps with the test time' do
      pending('figuring out how to write this test')
      fail
    end
  end
end
