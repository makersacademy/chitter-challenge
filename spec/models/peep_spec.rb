require_relative '../../app/models/user'
require_relative '../../app/models/peep'

describe Peep do

  let(:leo) do
    User.create(username: 'Leo',
                email: 'leo@test.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')

  end

  let(:jonny) do
    User.create(username: 'Jonny',
                email: 'jonny@test.com',
                password: 'another_password',
                password_confirmation: 'another_password')

  end

  it 'saves a peep with valid user' do
    expect(Peep.count).to eq 0
    peep = Peep.new(peep: "Where did the sun go?", user: jonny)
    peep.save
    expect(Peep.count).to be 1
  end
end
