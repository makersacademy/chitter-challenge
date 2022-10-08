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
end