require 'member'
require 'database_helpers'

describe '.create' do
  it 'Allows a new member to sign up to Chitter' do
    member = Member.create(name: 'Test Person', username: 'test123', email: 'test@example.com', password: 'password123')

    persisted_data = persisted_data(table: :members, id: member.id)

    expect(member).to be_a Member
    expect(member.id).to eq persisted_data['id']
    expect(member.name).to eq persisted_data['name']
    expect(member.username).to eq persisted_data['username']
    expect(member.email).to eq persisted_data['email']
    expect(member.password).to eq persisted_data['password']
  end
end
