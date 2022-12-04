require "spec_helper"
require "rack/test"
require_relative '../../app'

 def reset_chitter_tables
    seed_sql = File.read('seeds/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before(:each) do
    reset_chitter_tables
  end

  context "GET /" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>David</h1>')
      expect(response.body).to include('<div>message3</div>')
      expect(response.body).to include('<div>2022-02-20 02:01:01</div>')
    end
  end

  context "GET /new" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<input type="text" name="message" placeholder="Message">')
      expect(response.body).to include('<input type="text" name="name" placeholder="Name">')
      expect(response.body).to include('<input type="submit" value="Submit">')
    end
  end

  context "POST /new" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = post('/new', message: 'message4', name: 'David')
      expect(response.status).to eq(200)

      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("message4")
    end
  end
end