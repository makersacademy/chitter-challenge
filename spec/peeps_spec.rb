
RSpec.describe 'Peeps' do
  include Rack::Test::Methods

  it 'creates a new peep' do 
    Peeps.create(content: 'Hello')
    expect(Peeps.count).to eq 1
  end
end