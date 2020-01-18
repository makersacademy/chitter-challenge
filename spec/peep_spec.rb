require_relative '../lib/peep'

describe Peep do
  let(:subject) { Peep }

  describe '.all' do
    it { expect(subject.all).to be_a Array }

    it 'wraps database data in Peep object and assigns instance variables' do
      Peep.create(text: 'My first peep')
      expect(subject.all.first.text).to eq 'My first peep'

    end
  end

  describe '.create' do
    it 'creates new peep' do
    peep = subject.create(text: 'My second peep')
    expect(peep.first['text']).to include('My second peep')
    end
  end

end
