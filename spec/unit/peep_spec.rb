require './lib/peep.rb'

describe 'peep' do
  context 'given some peeps have been created in db' do
    before(:each) { @peeps = create_peeps }

    it 'should return all posted peeps' do
      expect(Peep.all.count).to eq(@peeps.count)
    end

    describe 'when returning a peep' do
      it 'should include content' do
        expect(Peep.all[0].content).to eq(@peeps[0][:content])
      end
    end
  end
end