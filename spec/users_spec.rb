RSpec.describe 'Users' do
  include Rack::Test::Methods
  
  it 'creates a new user' do
    user = User.create(name: 'Rita Aktay', username: 'ritavit', email: 'rita@gmail.com', password: 'pass12')
    expect(User.count).to eq 4
    expect(user.name).to eq 'Rita Aktay'
    expect(user.username).to eq 'ritavit'
    expect(user.email).to eq "rita@gmail.com"
    expect(user.password).to eq "pass12"
  end
end