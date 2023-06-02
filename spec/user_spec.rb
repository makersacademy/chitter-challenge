require_relative '../lib/models/user'

RSpec.describe User do
  let(:user) { User.new }

  it 'has attributes' do
    user.email = 'test@example.com'
    user.password = 'password'
    user.name = 'John Doe'
    user.username ='johndoe'

    expect(user.email).to eq('test@example.com')
    expect(user.password).to eq('password')
    expect(user.name).to eq('John Doe')
    expect(user.username).to eq('johndoe')
  end
end
