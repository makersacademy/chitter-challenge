require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_chitters_table
  seed_sql = File.read('spec/seeds_chitters.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

RSpec.describe Application do
  before(:each) do 
    reset_chitters_table
  end

  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /chitters" do
    xit 'returns a list of chitters in html' do
      response = get('/chitters')

      expected_response_0 = '<p>Time: 16:20:00 Chitter: dead</p><br />'
      expected_response_1 = '<p>Time: 16:21:00 Chitter: falling</p><br />'
      expected_response_2 = '<p>Time: 16:22:00 Chitter: flying solo</p><br />'

      expect(response.status).to eq(200)
      expect(response.body).to include(expected_response_0)
      expect(response.body).to include(expected_response_1)
      expect(response.body).to include(expected_response_2)

    end
  end

  context "POST /chitters" do
    it 'returns 200 OK' do
      response = post(
        '/chitters',
        peep: 'Spaghetti',
        peep_time: "12:00",
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include('Spaghetti has been added')

      get_chitters = get('/chitters')

      expect(get_chitters.body).to include('Spaghetti')
    end
  end

  context 'GET /chitters/new' do
    it 'returns a form page' do
      response = get("/chitters/new")

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/chitters">')
      expect(response.body).to include('<input type="text" name="peep" />')
      expect(response.body).to include('<input type="text" name="peep_time" />')
    end
  end
end