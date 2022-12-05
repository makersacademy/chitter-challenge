require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  def reset_table
    seeds_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
    connection.exec(seeds_sql)
  end

  before(:each) do
    reset_table
  end



  context 'GET /' do
    it 'returns a list of peeps' do
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include('Hey this is my funny content')
      expect(response.body).to include('2004-10-19 10:23:54')

      expect(response.body).to include('Read my fascinating content')
      expect(response.body).to include('2013-04-22 14:23:59')

      expect(response.body).to include('Another piece of content')
      expect(response.body).to include('2034-07-17 22:23:24')
    end
  end



  context 'GET /signup' do
    it 'returns a signup form' do
      response = get('/signup')
      expect(response.status).to eq 200

      expect(response.body).to include('<form method="POST" action="/signup">')
      expect(response.body).to include('<input type="text" name="email" />')
      expect(response.body).to include('<input type="text" name="password" />')
      expect(response.body).to include('<input type="submit" value="Sign up" />')
    end
  end

  context 'GET /login' do
    it 'returns a login form' do
      response = get('/login')
      expect(response.status).to eq 200

      expect(response.body).to include('<form method="POST" action="/login">')
      expect(response.body).to include('<input type="text" name="email" />')
      expect(response.body).to include('<input type="text" name="password" />')
      expect(response.body).to include('<input type="submit" value="Log in" />')
    end
  end


  context 'GET /account_page when not logged in' do
    it 'returns the account page' do
      response = get('/account_page')
      expect(response.status).to eq 302
      # expect(response.body).to include('You are user with id number:')
    end
  end

end
