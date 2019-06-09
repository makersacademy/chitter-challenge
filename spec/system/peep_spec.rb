require 'peep'

describe Peep do

  before(:each) do 
    Peep.create(title: 'my first title', content: 'my first peep is amazing', username: 'my_username')
    Peep.create(content: 'my second peep is not that great', username: 'my_username')
  end

  let(:peeps) { Peep.all }

  describe '#all' do
      it "can store multiple posts" do
        expect(peeps.length).to eq 2
        expect(peeps.first).to be_a Peep
        expect(peeps.last).to be_a Peep
        expect(peeps.first.content).to eq('my first peep is amazing')
        expect(peeps.last.content).to eq('my second peep is not that great')
      end
    end

  describe '#create' do
      it "can create a new peep" do
        expect(peeps.first).to be_a Peep
        expect(peeps.first.title).to eq('my first title')
        expect(peeps.first.content).to eq('my first peep is amazing')
      end
    end

  describe '#order' do
    it "can order my peeps" do
      ordered_peeps = peeps.order(created_at: :desc)
      expect(ordered_peeps.first.content).to eq('my second peep is not that great')
    end
  end
end