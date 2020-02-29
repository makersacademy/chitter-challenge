describe Peep do

  describe '.create' do
    let(:peep) { Peep.create(body: 'My first peep', time_posted: Time.now)}
    let(:persisted_data) { Peep.find_by id: peep.id }
    
    it 'creates a peep' do
      expect(peep).to be_a Peep
      expect(peep.body).to eq 'My first peep'
      expect(peep.id).to eq persisted_data.id
    end
  end

end
