require_relative '../../models/peep'

describe Peep do

  before :each do 
    add_peeps
  end

  describe '.all' do 
    it 'returns a list of peeps' do
      peep_1 = Peep.all.first
      peep_2 = Peep.all[1]
      peep_3 = Peep.all[-1]

      expect(peep_1.message).to eq 'This is my first peep!'
      expect(peep_1.creator).to eq 'USER_1'
      expect(peep_2.message).to eq 'This is my second peep!'
      expect(peep_2.creator).to eq 'USER_2'
      expect(peep_3.message).to eq 'This is my third peep!'
      expect(peep_3.creator).to eq 'USER_3'
    end
  end

  describe '.list_ordered_peeps' do 
    it 'returns peeps in reverse chronological order' do
      peep_1 = Peep.list_ordered_peeps.first
      peep_2 = Peep.list_ordered_peeps[1]
      peep_3 = Peep.list_ordered_peeps[-1]

      expect(peep_1.message).to eq 'This is my third peep!'
      expect(peep_1.creator).to eq 'USER_3'
      expect(peep_2.message).to eq 'This is my second peep!'
      expect(peep_2.creator).to eq 'USER_2'
      expect(peep_3.message).to eq 'This is my first peep!'
      expect(peep_3.creator).to eq 'USER_1'
    end
  end

  describe '.create' do 
    it 'creates a new peep' do
      peep = Peep.create(message: "A BRAND new peep!", creator: "PeepzDeluxe")
      persisted_data = PG.connect(dbname: 'peeps_test_manager').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'A BRAND new peep!'
      expect(peep.creator).to eq 'PeepzDeluxe'
    end

    it 'creates a peep when apostrophes are used' do
      peep = Peep.create(message: "Ya know, just livin' the life!", creator: "PeepzDeluxe")
      
      expect(peep.message).to eq "Ya know, just livin' the life!"
    end
  end
end