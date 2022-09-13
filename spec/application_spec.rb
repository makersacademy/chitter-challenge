RSpec.describe 'Application' do
  include Rack::Test::Methods

  let(:app) { Application.new }

  it 'gets homepage' do
    Peeps.create(:content => 'Hello, World!')
    response = get '/'
    expect(response.body).to eq 'Hello, World!'
  end
end