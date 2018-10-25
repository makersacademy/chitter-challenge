require 'peep'

describe Peep do

  describe '.create' do
    it 'returns a Peep object with right data' do
      fixed_time = Time.now
      allow(Time).to receive(:now).and_return(fixed_time)
      peep = Peep.create( username: 'user1', content: 'content1' )
      expect(peep).to be_a Peep
      expect(peep.username).to eq 'user1'
      expect(peep.content).to eq 'content1'
      expect(peep.time).to eq fixed_time
    end
  end

  describe '.all' do
    before do
      @peep_one = Peep.create( username: 'user1', content: 'content1' )
      @peep_two = Peep.create( username: 'user2', content: 'content2' )
      expect(Peep.all.length).to eq 2
    end

    it 'returns an array of Peep objects' do
      Peep.all.each do |peep|
        expect(peep).to be_a Peep
      end
    end

    it 'returns all of the peeps' do
      expect(Peep.all.length).to eq 2
    end

    it 'maintains same parameters of peeps' do
      first_peep = Peep.all[0]
      expect(first_peep.username).to eq @peep_one.username
      expect(first_peep.content).to eq @peep_one.content
    end
  end



end
