require 'peep'

describe Peep do
  describe '.create' do
    it 'creates a peep which we can then view' do 
      peep = Peep.create(text: 'Make America Great Again', user_name: 'Donald Trump', handle: 'POTUS', time_posted: Time.new)
      expect(peep.text).to eq 'Make America Great Again'
      expect(peep.user_name).to eq 'Donald Trump'
      expect(peep.handle).to eq 'POTUS'
      expect(peep.time_posted).to be_a Time
    end
  end
  describe '.all' do
    it 'returns all peeps' do
      Peep.create(text: 'Stop the vote!', user_name: 'Donald Trump', handle: 'POTUS', time_posted: Time.new)
      peeps = Peep.all
      expect(peeps.first.text).to eq 'Stop the vote!'
      expect(peeps.first.user_name).to eq 'Donald Trump'
      expect(peeps.first.handle).to eq 'POTUS'
    end
  end
end