require 'luv'

RSpec.describe Luv do
  let(:test_peep) { Peep.where(body: 'test').first }
  
  before(:each) do
    Peep.create body: 'test', user_id: 1
  end

  describe '#for(target)' do
    before(:each) do
      test_user_id = 1
      test_peep.receive_luv test_user_id, test_peep.id
      test_peep.receive_luv test_user_id, test_peep.id
    end

    it 'returns the number of luvs on a peep' do
      expect(Luv.all_for test_peep).to be 2
    end
  end
end
