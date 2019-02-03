require 'peeps'

describe Peeps do
  let(:user) { double(User.add(username: 'user1', password: 'password123', email: 'user1@gmail.com', name: 'user name'), id: User.list.first.id) }

  it 'can be create a new peep' do
    peep = Peeps.add(peep: 'New peep', user_id: user.id)
    expect(peep.peep).to eq 'New peep'
  end

  it 'is possible to see a list of peeps' do
    expect { Peeps.add(peep: 'New peep', user_id: user.id) }.to change { Peeps.list.count }.by 1
  end

  it 'can keep track of the time it was posted' do
    peep = Peeps.add(peep: 'New peep', user_id: user.id)
    expect(peep.time).to eq DateTime.now.to_s
  end
end
