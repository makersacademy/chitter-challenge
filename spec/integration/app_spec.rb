require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'json'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }
  
  before(:each) do
    query = File.read('./spec/seeds/chitter.sql')
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter" })
    connection.exec(query)
  end

  context 'GET to /peeps' do
    it 'returns a list of all peeps' do
      response = get('/peeps')
      expect(response.status).to eq 200
      expect(response.body).to include('<ul>Whats for tea? - 2022-08-20 18:15:48</ul>')
      expect(response.body).to include('<ul>Hungry. - 2022-09-15 11:37:22</ul>')
    end
  end
end
