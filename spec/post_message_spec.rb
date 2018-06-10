require 'peep'

describe Peep do

  describe '.post' do
    it 'a user can post a peep to Chitter' do
      User.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')

      peep_1 = Peep.post(peep: "This is my first peep", user: "Simone")

      expect(Peep.display).to include peep_1
    end
  end
end
