require './lib/peep'
require './lib/user'

describe Peep do

  let(:user) { { id: 1, email: 'test@example.com', username: 'testuser', name: 'Test User' } }

  it 'returns all peeps, with times' do
    
    Peep.create(text: 'Peep #1', user_id: user[:id])
    Peep.create(text: 'Peep #2', user_id: user[:id])
    Peep.create(text: 'Peep #3', user_id: user[:id])

    peeps = Peep.all

    expect(peeps.count).to eq 3
  end

  it 'creates a new peep' do

    user = User.create(email: 'test@example.com', name: 'Test User', username: 'testuser', password: '123456')

    Peep.create(text: 'Peep dis, yo!', user_id: user.id)

    expect(Peep.all.first.text).to eq 'Peep dis, yo!'
  end

  it 'can get info on its poster' do

    user = User.create(email: 'test@example.com', name: 'Test User', username: 'testuser', password: '123456')
    peep = Peep.create(text: 'Peep dis, yo!', user_id: user.id)
    peep_creator = peep.user
    
    expect(peep_creator).to be_a User
    expect(peep_creator.id).to eq user.id
  end

end
