require_relative '../../app/models/peep'

describe Peep do
  let(:email) { 'maker@makers.com' }
  let(:password) { '000000' }
  let!(:user) do
    User.create(email: email, password: password)
  end
  let!(:peep) do
    Peep.create(
      body: 'Hello',
      timestamp: Time.new,
      user: user
    )
  end

  describe '#user' do
    it 'allows access to user that created it' do
      expect(peep.user.email).to eq email
    end
  end
end
