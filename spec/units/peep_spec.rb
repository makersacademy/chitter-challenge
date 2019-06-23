require 'peep'

describe Peep do
  describe '.create' do
    it 'create a new peep' do      
      peep = Peep.create(content: 'Test message')
      expect(peep.content).to eq 'Test message'
      expect(peep).to be_an_instance_of(Peep)
    end
  end 

  describe '.order_by_date' do
    context 'Descending order' do
      it 'return all peeps' do
        first_peep = Peep.create(content: 'I love chocolate')
        second_peep = Peep.create(content: 'I love champagne')
        third_peep = Peep.create(content: 'I love Makers')

        all_peeps = Peep.order_by_date
        
        expect(all_peeps[0].content).to eq(third_peep.content)
        expect(all_peeps[1].content).to eq(second_peep.content)
        expect(all_peeps[2].content).to eq(first_peep.content)
      end
    end    
  end
end
