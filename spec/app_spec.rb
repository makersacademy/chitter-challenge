require "spec_helper"
require "rack/test"
require './app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'POST /users' do
    it 'adds a new user' do
      response = post('/users', email: 'pog@test.com', name: 'Pogba', username: 'PaulP' )
      expect(response.status).to eq 302
      response = get('/users')
      expect(response.body).to include('PaulP')
    end
  end

  context 'GET /peeps' do
    it "should get all of the peeps from users" do
      response = get('/peeps')

      expect(response.status).to eq 200
      expect(response.body).to include 'Ed BallS'
      expect(response.body).to include 'rochdale'
    end
  end 

  context 'GET /peep_form' do
    it "should get the form to post a new peep" do
      response = get('/peep_form')
      
      expect(response.status).to eq 200
      expect(response.body).to include '<form method="POST" action="/peeps" class="submit__peep" >'
    end
  end

  context 'POST /peep_form' do
    it 'should post a new peep using the form' do
        response = post('/peeps', content: 'cba getting up')
        expect(response.status).to eq 200
        response = get('/peeps')
        expect(response.body).to include('getting up')
    end
  end

  context 'GET /login' do
    it "should return a login page" do
      response = get('/login')

      expect(response.status).to eq 200
      expect(response.body).to include('<input type="text" name="email"')
    end
  end 
end