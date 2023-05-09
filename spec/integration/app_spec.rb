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
      expect(response.body).to include ('<a href="/peeps">View all peeps</a>')
    end
  end

  context '/peeps' do
    it 'Should display all peeps from all makers' do
      response = get('/peeps')
      expect(response.status).to eq (200)
      # expect(response.body).to include ('Hayley Lady')
      expect(response.body).to include ('Another test peep')
      expect(response.body).to include ('2023-07-21 12:25:12')
    end
  end


end
