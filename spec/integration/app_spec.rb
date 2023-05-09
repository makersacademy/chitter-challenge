require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do

  include Rack::Test::Methods
  let(:app) { Application.new }

  context '/' do
    it 'Should return a html formatted web page including a welcome banner' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include ('<h1>Welcome to the Chitter-Sphere!</h1>')
    end

    it 'Should include a photograph/graphic' do
      response = get('/')
      expect(response.body).to include ('<img src=></img>')
    end

    it 'Should include 3 different hyperlinks' do
      response = get('/')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<p>View all peeps</p>')
    end
  end
end
