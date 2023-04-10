require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  def reset_chitter_database_test
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_chitter_database_test
  end

  context 'GET /' do
    it "should display peeps in the homepage" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('peep 1')
      expect(response.body).to include('peep peep 2')
      expect(response.body).to include('new peep!')
    end
  end

  context 'GET /' do
    it "should display peeps in the homepage" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('peep 1')
      expect(response.body).to include('peep peep 2')
      expect(response.body).to include('new peep!')
    end

    it "returns the form to add a new post" do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/post">')
      expect(response.body).to include('<input type="text" name="message">')
      expect(response.body).to include('<input type="submit">')
    end
  end

  xcontext 'POST /post' do
    it "creates a post" do
      response = post('/post')
      expect(response.status).to eq(200)
    end

    # it "redirects to homepage" do
    #   response = post('/post')
    #   expect(response.status).to eq(200)
    # end
  end

  
end