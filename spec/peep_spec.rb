require 'peep_repo'

describe PeepRepo do
  before(:each) do 
    reset_tables
  end

  context 'when using the method .all' do
    it 'returns all the peeps in an array' do
      repo = PeepRepo.new
      result = repo.all
      expect(result.length).to eq 1
      expect(result[0].id).to eq '1'
      expect(result[0].message).to eq 'Fiona just shouted at me for not cleaning the outhouse'
      expect(result[0].time).to eq '2008-11-11 13:23:44'
      expect(result[0].user_account_id).to eq '1'
      expect(result[0].username).to eq 'fionalover420'
      expect(result[0].name).to eq 'Shrek'
    end
  end

  context 'when using the method .find' do
    it 'returns the peep with id = 1' do
      repo = PeepRepo.new
      result = repo.find(1)
      expect(result.id).to eq '1'
      expect(result.message).to eq 'Fiona just shouted at me for not cleaning the outhouse'
      expect(result.time).to eq '2008-11-11 13:23:44'
      expect(result.user_account_id).to eq '1'
    end
  end

  context 'when using the method .create' do
    it 'creates a peep that can be found in the database' do
      repo = PeepRepo.new
      new_peep = Peep.new
      new_peep.message = 'Fiona is taking the kids :('
      new_peep.time = '2008-11-11 18:31:24'
      new_peep.user_account_id = '1'
      repo.create(new_peep)
      result = repo.all
      expect(result).to include(
        have_attributes(
          message: new_peep.message,
          time: new_peep.time,
          user_account_id: '1'
        )
      )
    end
  end
end
