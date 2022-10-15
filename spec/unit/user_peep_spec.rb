require 'user_peep'

describe UserPeep do

  describe '#self.create' do
    it 'creates a new entry in userspeep table in chitter DB' do
      userpeep = UserPeep.create(user_id: '1', peep_id: '3')

      expect(userpeep).to be_a UserPeep
      expect(userpeep.user_id).to eq '1'
      expect(userpeep.peep_id).to eq '3'
    end
  end

end