require 'spec_helper'
require 'rack/test'
require_relative '../../app'


def reset_tables
  seed_sql = File.read('spec/seeds/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test'})
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do
    reset_tables
  end

  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /' do
    it 'outputs the index page with peeps' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Peeps</h1>')
      expect(response.body).to include('Have you seen my new kitty-cat? She is adorable!')
      expect(response.body).to include('By: cute-cat')
      expect(response.body).to include('At:')
      expect(response.body).to include('I am back from the dead and stronger than ever.')
    end
  end

  context 'GET /signin' do
    it 'returns the form page to sign in to chitter' do
      response = get('/signin')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/signin" method="POST">')
      expect(response.body).to include('<input type="text" name="name" required pattern="^[\w\-\s]+$">')
      expect(response.body).to include('<input type="text" name="username"')
      expect(response.body).to include('<input type="text" name="email"')
      expect(response.body).to include('<input type="password" name="password" id="myInput" required pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$">')
    end
  end

  context 'POST /' do
    it 'returns a success page' do
      response = post(
        '/',
        name: 'Saphire',
        username: 'sea-shell',
        email: 'email2@email.com',
        password: '123450000'
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('<p>Thank you for signing in to Chitter!</p>')
    end
  end
end