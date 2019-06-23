require 'member'
require 'database_helpers'

describe Member do
  describe '.create' do
    it 'Allows a new member to sign up to Chitter' do
      member = Member.create(
        name: 'Test Person',
        username: 'test123',
        email: 'test@example.com',
        password: 'password123')

      persisted_data = persisted_data(table: :members, id: member.id)

      expect(member).to be_a Member
      expect(member.id).to eq persisted_data['id']
      expect(member.name).to eq persisted_data['name']
      expect(member.username).to eq persisted_data['username']
      expect(member.email).to eq persisted_data['email']
      expect(member.password).to eq persisted_data['password']
    end
  end

  describe '.find' do
    it 'Finds a member by ID' do
      member = Member.create(
        name: 'Test Person',
        username: 'test123',
        email: 'test@example.com',
        password: 'password123')

      result = Member.find(id: member.id)

      expect(result.id).to eq member.id
      expect(result.name).to eq member.name
      expect(result.username).to eq member.username
      expect(result.email).to eq member.email
      expect(result.password).to eq member.password
    end

    it 'Returns nil if there is no ID given' do
      expect(Member.find(id: nil)).to eq nil
    end
  end
end
