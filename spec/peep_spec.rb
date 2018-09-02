require 'pg'

describe '.all' do
  it 'returns a list of peeps in reverse chronological order' do
    setup_test_database
    insert_test_urls_into_database
    peeps = Peep.all
    expect(peeps.last.peep).to eq "hello world!"
  end
end

describe '.create' do
  it 'creates a new peep' do
    setup_test_database
    peep = Peep.create('i am the peep_spec test')
    expect(peep).to be_a Peep
    expect(peep.peep).to eq "i am the peep_spec test"
  end
end

describe '.register' do
  it 'stores a registered user' do
    setup_test_user_database
    user = User.create('test@gmail.com', 'password')
  end
end
