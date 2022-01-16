require 'db_helpers'

describe '.all' do
  it 'returns all peeps in order of most recent' do

    user = User.sign_up(name: "Mr Test", username: "test_123", 
    password: "test@gmail.com", email: "password")
    
    peep1 = Peep.create_peep(message: 'test1', user_id: 1)
    peep2 = Peep.create_peep(message: 'test2', user_id: 1)

    peeps = Peep.all
    

    expect(peeps.length).to eq 2
    expect(peeps.first).to be_a(Peep)
    expect(peeps.first.id).to eq(peep2.id)
    expect(peeps.first.message).to eq('test2')
  end
end

describe '.create_peep' do
  it "allows the Maker to write and post a new message (peep)" do

    user = User.sign_up(name: "Mr Test", username: "test_123", 
      password: "test@gmail.com", email: "password")
      
    peep = Peep.create_peep(message: 'test peep', user_id: 1)

    persisted_data = persisted_data(id: peep.id)

    expect(peep).to be_a(Peep)
    expect(peep.id).to eq(persisted_data['id'])
    expect(peep.message).to eq('test peep')
  end
end