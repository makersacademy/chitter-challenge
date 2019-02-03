require 'peep'

describe Peep do

  before(:each) do
    @user = User.create('Test user', 'testuser', 'testuser@email.com', 'Password123')
  end

  it 'Has a method which adds a peep to the peeps database' do
    time = Time.now
    test_peep = Peep.create('Test peep', @user.id)
    expect(test_peep.text).to eq 'Test peep'
    expect(test_peep.time).to eq time.to_s
    expect(test_peep.user_id).to eq @user.id
    # add something to check id is correct?
  end

  it 'Can return all peeps' do
    Peep.create('Test peep', @user.id)
    expect(Peep.all[0]).to be_an_instance_of(Peep)
    expect(Peep.all[0].text).to eq 'Test peep'
  end
end
