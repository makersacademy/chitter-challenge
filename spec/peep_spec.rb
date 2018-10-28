require 'peep'
require 'user'

describe Peep do
  before do
    User.create(username: "user1", password: "password1", name: "Mr User", email: "user1@example.com")
    @t1 = Time.now
    @t2 = @t1 + 100
    allow(Time).to receive(:now).and_return(@t1)
    @peep_one = Peep.create(username: 'user1', content: 'content1')
    allow(Time).to receive(:now).and_return(@t2)
    @peep_two = Peep.create(username: 'user1', content: 'content2')
  end

  describe '.create' do
    it 'returns a Peep object with right data' do
      expect(@peep_one).to be_a Peep
      expect(@peep_one.username).to eq 'user1'
      expect(@peep_one.content).to eq 'content1'
      expect(@peep_one.time).to eq @t1.strftime("%H:%M")
    end
  end

  describe '.all' do
    it 'returns an array of Peep objects' do
      Peep.all.each do |peep|
        expect(peep).to be_a Peep
      end
    end

    it 'returns all of the peeps' do
      expect(Peep.all.length).to eq 2
    end

    it 'returns peeps in reverse chronological order' do
      expect(Peep.all[0].time).to eq @t2.strftime("%H:%M")
      expect(Peep.all[1].time).to eq @t1.strftime("%H:%M")
    end

    it 'maintains same parameters of peeps' do
      first_peep = Peep.all[0]
      expect(first_peep.username).to eq @peep_two.username
      expect(first_peep.content).to eq @peep_two.content
    end
  end

  describe '.delete' do
    scenario 'removes correct peep from database' do
      Peep.delete(@peep_one.id)
      expect(Peep.all.length).to eq 1
      expect(Peep.all[0].id).to eq @peep_two.id
    end
  end

  describe '.find' do
    scenario 'returns a peep with the passed id' do
      found_peep = Peep.find(@peep_one.id)
      expect(found_peep.id).to eq @peep_one.id
      expect(found_peep.content).to eq @peep_one.content
      expect(found_peep.username).to eq @peep_one.username
    end
  end

  describe '.change' do
    scenario 'it updates content of a peep' do
      Peep.change(@peep_one.id, "new_content")
      new_peep = Peep.find(@peep_one.id)
      expect(new_peep.content).to eq "new_content"
    end
  end
end
