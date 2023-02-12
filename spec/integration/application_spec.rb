require 'spec_helper'
require 'rack/test'
require_relative '../../app'

RSpec.describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do
    peep_seeds_sql = File.read("spec/seeds/peeps_seeds.sql")
    user_seeds_sql = File.read("spec/seeds/users_seeds.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_database_test" })
    connection.exec(peep_seeds_sql)
    connection.exec(user_seeds_sql)
  end

  context 'GET /' do
    it 'shows a list of peeps with usernames and time they were posted' do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include 'loving chitter'
      expect(response.body).to include '<h1>Chitter</h1>'
    end
  end
end