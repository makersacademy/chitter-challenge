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

      it 'should include created_at in formatted form' do
        exp_created_at = @peeps[0][:created_at].strftime(
          '%e %b %Y %H:%M:%S%p'
        )

        expect(Peep.all[0].formatted_created_at).to eq(exp_created_at)
      end
    end
  end
end