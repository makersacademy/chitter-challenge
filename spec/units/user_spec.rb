require 'user'

describe User do
  it 'shows all users' do
    expect(described_class.all.first.username).to eq 'Patricia'
  end
  it 'creates a new user' do
    described_class.create(username: 'Daniel', email: 'example@test.com', password: '12345')
    expect(described_class.all.last.username).to eq 'Daniel'
  end
end
