describe Peep do

  context 'Testing datamapper works' do

    let(:peep_obj) { described_class }

    it 'can be created and then retrieved from the db' do
      expect(peep_obj.count).to eq 0
      peep_obj.create(content: 'Today is gonna be a big day')
      expect(peep_obj.count).to eq 1
      peep = peep_obj.first
      expect(peep.content).to eq 'Today is gonna be a big day'
      peep.destroy
      expect(peep_obj.count).to eq 0
    end
  end
end