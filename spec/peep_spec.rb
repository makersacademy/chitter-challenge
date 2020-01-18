require_relative '../lib/peep'

describe Peep do
  let(:subject) { Peep }

  describe '.all' do
    it { expect(subject.all).to be_a Array }

    it 'sets timestamp instance variable' do
      time = Time.now.strftime("%Y-%m-%d %H:%M")
      subject.create(text: 'My first peep', timestamp: time)
      expect(subject.all.first.timestamp).to include(time)
    end

    it 'wraps database data in Peep object and assigns instance variables' do
      Peep.create(text: 'My second peep')
      expect(subject.all.first.text).to eq 'My second peep'
    end
  end

  describe '.create' do
    it 'creates new peep' do
      peep = subject.create(text: 'My third peep')
      expect(peep.first['text']).to include('My third peep')
    end

    it 'adds timestamp' do
      time = Time.now.strftime("%Y-%m-%d %H:%M")
      peep = subject.create(text: 'My fourth peep', timestamp: time)
      expect(peep.first['timestamp']).to include(time.to_s)
    end
  end

end
