require "spec_helper"
require "rack/test"
require_relative '../../app'


describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }


#   def reset_users_table
#     seed_sql = File.read('spec/chitter_seeds.sql')
#     connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
#     connection.exec(seed_sql)
#   end

#   def reset_peeps_table
#     seed_sql = File.read('spec/chitter_seeds.sql')
#     connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
#     connection.exec(seed_sql)
#   end

  context 'GET /' do
    it 'returns 200 OK and a form to sign in' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Welcome to Chitter</h1>")
      expect(response.body).to include('<form action="/signup" method="POST">')
    end
  end
end