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
      expect(response.body).to include('<ul>Whats for tea? - 2022-08-20 18:15:48')
      expect(response.body).to include('<ul>Hungry. - 2022-09-15 11:37:22')
    end
  end

  context 'GET /peeps/new' do
    it 'returns form to enter new peep' do
      response = get('/peeps/new')
      expect(response.status).to eq 200
      expect(response.body).to include ('<h1>Please enter your peep here</h1>')
      expect(response.body).to include ('<form action="/peeps" method="POST">')
    end
  end

  context 'POST /peeps' do
    it 'returns a success message if peep has been posted and checks if peep has been added to all peeps' do
      post_response = post('/peeps', content: 'This is my first peep')
      expect(post_response.status).to eq 200
      expect(post_response.body).to include('Peep successfully posted!')
      get_response = get('/peeps')
      expect(get_response.status).to eq 200
      expect(get_response.body).to include('This is my first peep')
    end

    it 'returns 400 error if content is empty' do
      response = post('/peeps', content: '')
      expect(response.status).to eq 400
      expect(response.body).to include 'ERROR: Contents field must be filled'
    end
  end
end
