require 'chitter'

describe Chitter do

  describe '.all_peeps' do

    it 'returns all peeps and attr methods (id, time, peep)' do
      Chitter.peep('First peep')
      Chitter.peep('Second peep')
      Chitter.peep('Third peep')

      expect(Chitter.all_peeps[0].peep).to eq("First peep")
      expect(Chitter.all_peeps[0].id).to eq Chitter.all_peeps[0].id
      expect(Chitter.all_peeps[0].time).to eq Time.now.strftime("%F %T")
      expect(Chitter.all_peeps[1].peep).to eq("Second peep")
      expect(Chitter.all_peeps[2].peep).to eq("Third peep")
      expect(Chitter.all_peeps.length).to eq 3
    end

  end

end
