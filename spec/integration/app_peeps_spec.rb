require "spec_helper"
require "rack/test"
require_relative '../../app'
require_relative '../reset_database_tables'

describe Application do

  before(:each) do
    ResetDatabaseTables.new.reset
  end

  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /' do
    it 'returns homepage' do
      response = get('/')

      expect(response.body).to include('Chitter</a></h1>')
      expect(response.body).to include('peeps">See all Peeps!</a></h2>')
      expect(response.body).to include('new">Post a Peep!</a></h2>')
      expect(response.body).to include('>Sign up!</a></h2>')
    end
  end

  context 'GET /peeps' do
    it 'returns all peeps - latest peeps first' do
      response = get('/peeps')

      # extra spacing in next test to account for the spacing in peeps.erb
      expect(response.body).to include("Latest peep is from:\n      @monica0")
      expect(response.body).to include("Does anybody care what kind of potatoes I want!?")
      expect(response.body).to include("Monica")
      expect(response.body).to include("monica0")     
      expect(response.body).to include("Hello, I am Wendy!")
      expect(response.body).to include("Wendy")
      expect(response.body).to include("wendy0")
    end
  end

  context "GET /peeps/new" do
    it "returns a form to add a new peep" do      
      response = post(
        '/sessions',
        email: 'wendy0@example.com',
        password:'password123',
      )
      
      response = get("/peeps/new")      
      
      expect(response.body).to include('<form action="/peeps" method="POST">')
      expect(response.body).to include('What do you want to say?')      
      expect(response.body).to include('<input type="text" name="content"')
      expect(response.body).to include('<input type="submit" value="Peep!">')
    end

    it "redirects user to login page if not logged in" do
      response = get("/peeps/new")
      expect(response.body).to include('Log into your account!')
    end
  end

  context "GET /peeps/posted" do
    it "returns a confirmation page" do
      response = get("/peeps/posted")

      expect(response.body).to include('Thank you for posting!')
    end
  end

  context "POST /peeps" do
    it 'creates a new peep after successful user login' do

      response = post(
        '/sessions',
        email: 'wendy0@example.com',
        password:'password123',
      )
      
      response = post(
        '/peeps',
        content: 'Hello, there!',
      )

      response = get('/peeps')

      expect(response.body).to include('Hello, there!')
      expect(response.body).to include('Wendy')
      expect(response.body).to include('wendy0')
    end
  end

  it 'special HTML characters in a peep are successfully escaped' do
    response = post(
      '/peeps',
      content: '<h1>Escape!</h1>',
    )    

    response = get('/peeps')

    expect(response.body).to include('&lt;h1&gt;Escape!&lt;/h1&gt;')
  end
end
