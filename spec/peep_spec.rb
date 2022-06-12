require 'peep'

RSpec.describe Peep do
  it 'constructs' do
    time = double :time, now: Time.new(2022, 06, 12, 15, 49, 02)
    peep = Peep.add('my wife just left me', time)
    expect(Peep.all).to eq [['my wife just left me', '15:49:00']]
  end

  xit 'shows a different peep' do
    peep = Peep.add('my wife came back!')
    expect(Peep.all).to eq ['my wife came back!']
  end

  describe ".double_apostrophe" do
    it 'does nothing if no apostrophe is present' do
      expect(Peep.double_apostrophe('my wife came back!')).to eq 'my wife came back!'
    end

    it 'doubles an apostrophe if present' do
      expect(Peep.double_apostrophe("What's your favourite colour?")).to eq "What''s your favourite colour?"
    end
  end

  describe 'self.all' do
    xit 'shows a peep that has been created' do
      Peep.add("What's your favourite colour?")
      expect(Peep.all).to eq ["What's your favourite colour?"]
    end

    xit 'shows mutliple peeps that have been created, in reverse chronological order' do
      Peep.add("What's your favourite colour?")
      p Peep.all
      Peep.add("Loving the sunshine!!!")
      p Peep.all
      expect(Peep.all).to eq ["Loving the sunshine!!!", "What's your favourite colour?"]
    end
  end
end
