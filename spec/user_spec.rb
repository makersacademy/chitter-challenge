require_relative '../lib/models/user'

RSpec.describe User do
  let(:user) { User.new(id: 1, email: 'test@example.com', password: 'password', name: 'John Doe', username: 'johndoe') }

  it 'has attributes' do
    expect(user.id).to eq(1)
    expect(user.email).to eq('test@example.com')
    expect(user.password).to eq('password')
    expect(user.name).to eq('John Doe')
    expect(user.username).to eq('johndoe')
  end
end
