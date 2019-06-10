describe Peep do
  before(:each) do
    DataMapper.auto_migrate!
    create_users
    create_peeps
  end
  let(:time) { Time.now }
  let(:peep) { Peep.new(id: 1, text: 'Test peep', created_at: time, user_id: 1) }
  let(:peter_id) { User.first({ username: 'Peter' }).id }
  let(:first_peep_id) { Peep.first({ text: 'First ever peep!!!!' }) }
  describe '.all' do
    it 'returns an array of peeps' do
      expect(Peep.all).to(satisfy { |array| array.all?(Peep) })
    end

    it 'returns peeps with the test text' do
      expect(Peep.all[0].text).to eq('First ever peep!!!!')
    end

    it 'returns peeps with the test time' do
      now = Time.now
      string = now.strftime('%Y%m%d%H%I%M')
      Peep.create(text: "Testing time", created_at: now)
      expect(Peep.all.last.created_at.to_time.strftime('%Y%m%d%H%I%M')).to eq(string)
    end
  end

  describe '#format_created_at' do
    it 'returns a formatted date and time' do
      expected = time.strftime("#{time.day.ordinalize} of %B, %Y at %-l:%M%P")
      expect(peep.format_created_at).to eq(expected)
    end
  end

  describe '#user' do
    it 'returns the user associated with the peep' do
      expect(Peep.first.user.id).to be peter_id
      expect(Peep.first.user.username).to eq('Peter')
    end
  end

  describe '#peep_id' do
    it 'returns the peep associated with the peep' do
      new_peep = Peep.create(text: 'Replying to the first peep', user_id: peter_id, peep_id: first_peep_id)
      expect(new_peep.peep_id.text).to eq('First ever peep!!!!')
    end
  end
end
