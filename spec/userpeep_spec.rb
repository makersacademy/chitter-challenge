require 'features/web_helpers'
require 'userpeep'

describe UserPeep do

  describe '#self.create' do
    it 'creates a new UserPeep entry in relational DB' do
      user_peep = UserPeep.create(user_id: '6', peep_id: '754')

      expect(user_peep).to be_a UserPeep
      expect(user_peep.user_id).to eq '6'
      expect(user_peep.peep_id).to eq '754'
    end
  end

  describe '#self.all' do
    it 'returns a 2d array with content/handle/time for each peep' do
      user_peeps = UserPeep.all
      expect(user_peeps).to be_a(Array)
    end
  end
end
