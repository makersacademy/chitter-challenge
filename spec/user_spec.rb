require 'user'

RSpec.describe User do
  let(:test_user) { User.new 'Sam123', 'sam@example.com', '1234icecream' }

  it 'has a seperate username' do
    expect(test_user.username).to eq 'Sam123'
  end

  it 'has a login email' do
    expect(test_user.email).to eq 'sam@example.com'
  end

  it 'has a login password' do
    expect(test_user.password).to eq '1234icecream'
  end
end
