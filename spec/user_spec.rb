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
end
