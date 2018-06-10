require 'peeps'
describe Peeps do
  let(:enter_user) { User.create(
    email: 'test@example.com',
    username: 'tester',
    name: 'John Doe',
    password: 'hunter123')
  }
  describe '#create' do
    it 'creates a new peep' do
      user = enter_user
      peep = Peeps.create(text: "Testing 123", user_id: user.id)
      expect(Peeps.all).to include peep
    end
  end
end
