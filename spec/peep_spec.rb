require 'peep'

describe Peep do
  describe 'self.new_peep' do
    it 'creates a new peep on the database and a instance of Peep' do
      peep = Peep.new_peep('My first peep!', '1')

      stored_data = stored_peep(table: 'peeps', peep_id: peep.peep_id)
      
      expect(peep).to be_a(Peep)
      expect(peep.user_id).to eq(stored_data.first['user_id'])
      expect(peep.peep_id).to eq(stored_data.first['peep_id'])
      expect(peep.message).to eq(stored_data.first['message'])
    end
  end

  describe 'Contains the data for a peep' do
    it "has an id, message, user_id and date it was created" do
      peep = Peep.new(peep_id: '1', message: 'My first peep!', user_id: '1', created_at: "#{Time.now}")
      expect(peep).to respond_to(:peep_id)
      expect(peep).to respond_to(:message)
      expect(peep).to respond_to(:user_id)
      expect(peep).to respond_to(:created_at)
    end
  end
end
