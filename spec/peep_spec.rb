require 'peep'

RSpec.describe Peep do
  it 'constructs' do
    peep = Peep.new('my wife just left me')
    expect(peep.post).to eq ['my wife just left me']
  end

  it 'shows a different peep' do
    peep = Peep.new('my wife came back!')
    expect(peep.post).to eq ['my wife came back!']
  end

  describe ".double_apostrophe" do
    it 'does nothing if no apostrophe is present' do
      peep = Peep.new('my wife came back!')
      expect(peep.double_apostrophe).to eq 'my wife came back!'
    end

    it 'doubles an apostrophe if present' do
      peep = Peep.new("What's your favourite colour?")
      expect(peep.double_apostrophe).to eq "What''s your favourite colour?"
    end
  end
end
