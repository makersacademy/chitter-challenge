require './lib/peep'

RSpec.describe Peep do 
  let(:peep) { Peep.create({ user_id: 1, title: "test1", content: "testing" }) }
  describe '#create' do
    
    it 'A user can make a peep' do
      expect(peep.title).to eq "test1"
    end
    it 'connects peep to user that posted' do
      expect(peep.user_id).to eq 1
    end
  end
end
