require "spec_helper"
require "rack/test"
require_relative '../../app'
require_relative '../../lib/database_connection'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before(:each) do
    peeps_seeds_sql = File.read("spec/seeds/peeps_seeds.sql")
    makers_seeds_sql = File.read("spec/seeds/makers_seeds.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_chatter_test" })
    connection.exec(peeps_seeds_sql)
    connection.exec(makers_seeds_sql)
  end
end

context "GET /" do
  it 'returns 200 OK with full list of peeps' do
    response = get('/')

    expect(response.status).to eq(200)
    expect(response.body).to include('Wanna read what our peeps have got to say?')
  end
end
