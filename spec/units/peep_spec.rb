require './models/peep'

describe Peep do

  let(:subject) { described_class.new(created_at: Time.new(2020, 10, 31, 17, 52, 3)) }

  describe ".sort_by_date_created" do
    it 'sorts an array of peeps by created_at date' do
      peep_1 = double(created_at: Time.now)
      peep_2 = double(created_at: Time.now - 2000)
      peep_3 = double(created_at: Time.now + 3600)

      peep_list = [peep_1, peep_2, peep_3]

      expect(Peep.sort_by_date_created(peep_list)[0].created_at).to eq(peep_3.created_at)
    end
  end

  describe '#created_at_time' do
    it 'returns the time it was created as a string' do
      expect(subject.created_at_time).to eq('17:52')
    end
  end

  describe '#created_at_date' do
    it 'returns the date it was created as a string' do
      expect(subject.created_at_date).to eq('31/10/2020')
    end
  end
end
