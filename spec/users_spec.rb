RSpec.describe 'Users' do
  include Rack::Test::Methods
  
  it 'creates a new user' do
    user = Users.new(name: 'Rita Aktay', username: 'ritavit', email: 'rita@gmail.com')
    expect(user.name).to eq "Rita Aktay"
  end
end