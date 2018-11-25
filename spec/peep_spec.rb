require 'peep'

describe Peep do

  describe '.write' do
    it 'creates a new peep' do
      connection = PG.connect(dbname: 'chitter_test')
      user = User.create(email: 'test@example.com', password: 'password123')
      peep = Peep.create(text: 'This is a test peep', user_id: user.id)
      expect(peep).to be_a Peep
      expect(peep.text).to eq 'This is a test peep'
      expect(peep.user_id).to eq user.id
    end
  end

end
