require 'peep'

describe 'Create peep' do

  it 'creates a peep with given details' do
    user = User.sign_up(name: 'any', email: 'any', username: 'any', password: 'any')

    peep = Peep.create(text: 'a peep', user_id: user.id)

    expect(peep.id).to be > 0
    expect(peep.text).to eq 'a peep'
    expect(peep.user_id).to eq user.id
    expect(peep.date).not_to be_nil
  end

end
