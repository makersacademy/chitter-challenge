require 'peep'

describe 'List all peeps' do

  it 'is empty without peeps' do
    expect(Peep.all).to be_empty
  end

  it 'contains all peeps ever created in descending order' do
    user = User.sign_up(name: 'any', email: 'any', username: 'any', password: 'any')
    oldest_peep = Peep.create(text: 'a peep', user_id: user.id, timestamp: Time.now - 10)
    newest_peep = Peep.create(text: 'another peep', user_id: user.id, timestamp: Time.now + 10)

    peeps = Peep.all

    expect(peeps.count).to eq 2
    expect(peeps[0].id).to eq newest_peep.id
    expect(peeps[1].id).to eq oldest_peep.id
  end

end
