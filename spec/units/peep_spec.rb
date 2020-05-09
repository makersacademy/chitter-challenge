require './models/peep'

describe Peep do
  describe ".sort_by_date_created" do
    it 'sorts an array of peeps by created_at date' do
      peep_1 = double(created_at: Time.now)
      peep_2 = double(created_at: Time.now - 2000)
      peep_3 = double(created_at: Time.now + 3600)

      peep_list = [peep_1, peep_2, peep_3]

      expect(Peep.sort_by_date_created(peep_list)[0].created_at).to eq(peep_3.created_at)
    end
  end
end
