require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET to /' do
    it 'returns 200 OK with a list of peeps' do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Chitter</h1>')
      expect(response.body).to include('<h2>Hello world</h2>')
    end
  end

  context 'GET to /peeps/new' do
    it 'returns 200 OK with a form to create new peep' do
      response = get('/peeps/new')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Create a new peep</h1>')
      expect(response.body).to include('<form action="/peeps" method="post">')
      expect(response.body).to include('<input id="message" type="text" name="message" />')
    end
  end
end
