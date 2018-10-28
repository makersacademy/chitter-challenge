require 'peep'
require 'user'
require 'date'

describe Peep do

  describe '::create' do
    it 'should create a peep and add to the database' do
      peep = Peep.create(body: 'Test peep', user_id: '1')
      persisted_data = persisted_data(id: peep.id, table: 'peeps')
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.body).to eq 'Test peep'
      expect(peep.user).to be_a User
    end
  end

  describe '::find' do
    it 'should retreive a peep from the database and return Peep object' do
      peep = Peep.find(1)
      expect(peep).to be_a Peep
      expect(peep.id).to eq '1'
      expect(peep.body).to eq 'First test peep'
      expect(peep.created_at).to be_a DateTime
    end
  end

  describe '::all' do
    it 'should return an array of all peeps from the database' do
      expect(Peep.all.length).to eq 3
    end
  end

end
