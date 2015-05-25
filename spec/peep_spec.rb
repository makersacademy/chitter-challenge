require 'spec_helper'

describe Peep do

  context 'Checking that datamapper works' do
    it 'can be created and then retrieved from the db' do
      User.create(email: 'test@test.com',
                  password: 'test',
                  password_confirmation: 'test',
                  name: 'Testname',
                  username: 'Testusername')
      user = User.first
      expect(described_class.count).to eq(0)
      described_class.create(message: 'my first peep!',
                             time: Time.now,
                             user_id: user.id)
      expect(described_class.count).to eq(1)
      peep = described_class.first
      expect(peep.message).to eq('my first peep!')
      expect(peep.user_id).to eq(user.id)
      peep.destroy
      expect(described_class.count).to eq(0)
    end
  end
end
