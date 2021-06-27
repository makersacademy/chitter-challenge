require 'peep'
require 'database_helpers'

describe Peep do
  let(:user) { User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1') }
  let(:real_user_id) { user.user_id }
  # Not sure how to isolate - need real user_id, the db verifies foreign keys

  describe '.all' do
    it 'returns all peeps' do
      # Add the test data
      Peep.create(peep_text: 'This is a peep', user_id: real_user_id)
      Peep.create(peep_text: 'Peep peep!', user_id: real_user_id)
      peep = Peep.create(peep_text: 'peeping away 🐥', user_id: real_user_id)
      
      peeps = Peep.all
      
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.peep_id).to eq peep.peep_id
      expect(peeps.first.peep_text).to eq 'peeping away 🐥'
      expect(peeps.first.peeped_on).to eq peep.peeped_on
    end

    it 'returns peeps in reverse chronological order' do
      Peep.create(peep_text: 'This is a peep', user_id: real_user_id)
      Peep.create(peep_text: 'Peep peep!', user_id: real_user_id)
      Peep.create(peep_text: 'peeping away 🐥', user_id: real_user_id)
      peeps = Peep.all

      expect(peeps.first.peep_text).to eq 'peeping away 🐥'

      Peep.create(peep_text: 'This is a newer peep', user_id: real_user_id)
      peeps = Peep.all

      expect(peeps.first.peep_text).to eq 'This is a newer peep'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep_text: "Test my peep.", user_id: real_user_id)
      persisted_data = persisted_data(id: peep.peep_id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.peep_id).to eq persisted_data.first['peep_id']
      expect(peep.peep_text).to eq "Test my peep."
      expect(peep.peeped_on).to eq persisted_data.first['peeped_on']
    end
  end

  describe '.who' do
    it 'gets the relevant user from the database' do
      Peep.create(peep_text: "Test my peep.", user_id: real_user_id)
      Peep.create(peep_text: "Testing second peep", user_id: real_user_id)

      peeps = Peep.who(user_id: real_user_id)
      peep = peeps.first
      persisted_data = persisted_data(id: peep.peep_id, table: 'peeps')

      expect(peeps.length).to eq 2
      expect(peep.peep_id).to eq persisted_data.first['peep_id']
      expect(peep.peep_text).to eq "Test my peep."
      expect(peep.user_id).to eq real_user_id
    end
  end
end
