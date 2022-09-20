require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /signup' do
    it 'shows sign up page' do
      response = get('/login')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/index">')
      expect(response.body).to include('<input type="text" name="email" />')
      expect(response.body).to include('<input type="text" name="password" />')
    end
  end


  context 'POST /login' do
    it 'accepts or refuses login credentials' do
      response = post(
        '/login',
        email: 'fake@email.com',
        password: 's3cretp4ss',
      )

      response = get('/')

      expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
    end
  end
end