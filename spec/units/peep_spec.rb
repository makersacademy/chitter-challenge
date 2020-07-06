require 'peep'

describe Peep do
  describe '.create' do
    it 'adds a peep' do
      user = User.create(name: "Gareth", email: "gareth@gmail.com", password: '12345')

      peep_message = "Im adding a peep"
      Peep.create(user_id: user.id , message: peep_message)

      peeps = Peep.all

      expect(peeps.first.message).to eq peep_message
    end
  end

  describe '#user' do
    it 'returns user from database based on foriegn key' do
      user = User.create(name: "Gareth", email: "gareth@gmail.com", password: '12345')
      peep = Peep.create(user_id: user.id , message: "Im adding a peep")

      expect(peep.user).to be_a(User)
    end
  end

end
