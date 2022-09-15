require 'rack/test'

RSpec.describe 'Peeps' do
  include Rack::Test::Methods
  
  it 'creates a peep' do
    Peep.create(content: 'Hello, World!')
    expect(Peep.count).to eq 5
  end

  it 'retreives all peeps with users' do
    result = Peep.joins(:user)
    expect(result.first.content).to eq 'just setting up my twttr'
    expect(result.first.user.name).to eq 'Jack Dorsay'
  end
end