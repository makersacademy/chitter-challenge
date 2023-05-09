require "spec_helper"
require "rack/test"
require_relative "../../app"

RSpec.describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /" do
    it 'displays an html view of the homepage with links to sign up or log in' do
      response = get("/")

      expect(response.status).to eq 200

      expect(response.body).to include "<a href=\"/signup\"> Sign up </a>"
      expect(response.body).to include "<a href=\"/login\"> Log in </a>"
    end

    xit 'lists the current peeps in the database in reverse chronological order' do
      # how to deal with non-deterministic database record?
    end
  end

  context 'GET /signup' do
    it 'displays an html view with a form to create a new user' do
      response = get('/signup')

      expect(response.status).to eq 200

      expect(response.body).to include '<h1> Sign up </h1>'

      expect(response.body).to include '<form method="POST" action="/new-user">'

      expect(response.body).to include '<input type="text" name="name">'
      expect(response.body).to include '<input type="text" name="email_address">'
      expect(response.body).to include '<input type="text" name="password">'
    end
  end

  context 'POST /new-user' do
    it 'creates an new user in the database and returns an html view with confirmation' do
      response = post(
        '/new-user',
        name: 'Jeff',
        email_address: 'Jeff@gmail.com',
        password: '12345678'
      )

      expect(response.status).to eq 200

      expect(response.body).to include '<h1> Welcome to Chitter, Jeff! </h1>'

      latest_user = User.last

      expect(latest_user.name).to eq 'Jeff'
      expect(latest_user.email_address).to eq 'Jeff@gmail.com'
      expect(latest_user.password).to eq '12345678'
    end

    # need to test validations and failed sign up

    it 'links to a user page' do
      response = post('/new-user' )

      expect(response.body).to include "<a href=\"/user/page\"> Click here to access your personal page </a>"
    end

    # will implement username in path when I implement sessions
  end

  context 'GET /user/page' do
    it 'displays an html view with a link to create a peep' do
      
    end

    xit 'lists the current peeps in the database in reverse chronological order' do
      # how to deal with non-deterministic database record?    
    end
  end
end