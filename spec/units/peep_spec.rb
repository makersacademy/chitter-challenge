require_relative '../../app/models/peep'

describe Peep do
  let(:user){User.create(
    email: 'test@examp.le',
    password: 'secret',
    password_confirmation: 'secret',
    username: 'jonodoe',
    name: 'John Doe')}
  subject(:peep){described_class.new(message: 'This is my message', user: user)}
  subject(:peep2){described_class.new(message: 'This is my message', user: user)}

  context 'defaults' do
    it 'create a new peep' do
      expect{peep.save}.not_to raise_error
    end
  end

  context '.sort_time_rev' do
    it 'shows a list of peeps with inverted chronological order' do
      peep.save
      sleep 1
      peep2.save
      expect(Peep.sort_time_rev).to eq([peep2, peep])
    end
  end
end
