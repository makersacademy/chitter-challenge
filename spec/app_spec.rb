require "spec_helper"
require "rack/test"
require_relative '../app'
 
def reset_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
  connection.exec(seed_sql)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before(:each) do 
    reset_table
  end

    context "GET /new" do
    it 'returns a form page to post a new peep' do
      response = get('/new')

    #   expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Peep here: </h1>')
      expect(response.body).to include('<form action="/newpeep" method="POST">')
    end
  end

  context "POST /newpeep" do
    it 'returns a success page when a new peep is added using the GET /new route' do
      response = post('/newpeep', 
      contents: 'Lucky number seven', 
      timestamp: '23:12',
      user_id: '3'
      )
    # expect(response.status).to eq(200)
    expect(response.body).to include('<p>Your peep has been posted.</p>')
    end

    it 'fails due to invalid input' do
      response = post('/albums',
      contents: '',
      timestamp: '23:12',
      user_id: '2'
      )

    #   expect(response.status).to eq(400)
      expect(response.body).to include("Invalid input")
    end
  end

  context "GET /" do
    it 'returns the front page, a list of all peeps formatted in HTML' do
      response = get('/')
    
      expect(response.body).to include('Test peep 5 contents with 2 integers')
      expect(response.body).to include('Test peep 1 contents as a string')
    #   expect(response.status).to eq(200)
    end
  end
end