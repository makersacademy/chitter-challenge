require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  def reset_posts_table
    seed_sql = File.read('spec/seeds/seeds_posts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database' })
    connection.exec(seed_sql)
  end

  def reset_user_table
    seed_sql = File.read('spec/seeds/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_posts_table
    reset_user_table
  end

  context 'GET/' do
    it 'is the homepage with login and signup' do
        response = get('/')

        expect(response.status).to eq 200
        expect(response.body).to include('<h1>Chitter</h1>')
        expect(response.body).to include('<input type="text" name="Log In">')
        expect(response.body).to include('<input type="text" name="Sign Up">')
    end
  end
end