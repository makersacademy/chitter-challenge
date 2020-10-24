require 'database_helpers'
require 'maker'

describe '.create' do
  it 'creates a new user' do
    maker = Maker.create(email: 'test@example.com', password: 'password123', name: 'rubberduck')

    persisted_data = persisted_data(table: :makers, id: maker.id)

    expect(maker).to be_a Maker
    expect(maker.id).to eq persisted_data['id']
    expect(maker.email).to eq 'test@example.com'
  end
  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')
    Maker.create(email: 'test@example.com', password: 'password123', name: 'rubberduck')
  end
end

describe '.find' do
  it 'finds a maker by id' do
    maker = Maker.create(email: 'test@example.com', password: 'password123', name: 'rubberduck')

    result = Maker.find(id: maker.id)

    expect(result.id).to eq maker.id
    expect(result.email).to eq maker.email
    expect(result.name).to eq maker.name
  end
  it 'returns nil id there is no ID given' do
    expect(Maker.find(id: nil)).to eq nil
  end
end
