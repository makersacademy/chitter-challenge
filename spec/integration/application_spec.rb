require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'dotenv/load'

# # def reset_users_table
# #   seed_sql = File.read('spec/seeds/users_seeds.sql')
# #   connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test', user: ENV['MY_USER'], password: ENV['PASSWORD'] })
# #   connection.exec(seed_sql)
# # end

# # def reset_peeps_table
# #   seed_sql = File.read('spec/seeds/peeps_seeds.sql')
# #   connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test', user: ENV['MY_USER'], password: ENV['PASSWORD'] })
# #   connection.exec(seed_sql)
# # end

def reset_chitter_table
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test', user: ENV['MY_USER'], password: ENV['PASSWORD'] })
  connection.exec(seed_sql)
end



RSpec.describe Application do
   include Rack::Test::Methods

   before:each do 
     reset_users_table
     reset_peeps_table
     reset_chitter_table
   end

  let(:app) { Application.new }

    context "GET /" do 
      it "Returns information on the chitter homepage" do 
        response = get('/')

        expect(response.status).to eq(200)
       expect(response.body).to include ("<h1> Welcome to chitter </h1>")
      end 
    end 

end 





