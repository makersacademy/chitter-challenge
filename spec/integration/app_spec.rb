require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_users_table
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe Application do
 

  before(:each) do
    reset_users_table
  end
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

    context "GET /" do
        it "returns a welcome and asks new user to sign up" do
            response = get('/')

            expect(response.status).to eq 200
            expect(response.body).to include('<h1>Welcome to Chitter</h1>')
            expect(response.body).to include('<form method="POST" action="/users">')
            expect(response.body).to include('input type="text" name="username" />') 
            expect(response.body).to include('input type="text" name="email" />')
        end
    end

    context "GET /users" do
        it "returns a list of all the chitter users" do
            response = get('/users')

            expect(response.status).to eq 200
            expect(response.body).to include('<h1>Chitter Users</h1>')
            expect(response.body).to include('<a href="/users/1">Yannis</a>')
            expect(response.body).to include('<a href="/users/2">Jimmy</a>')
            expect(response.body).to include('<a href="/users/3">Jack</a>')
        end
    end

    context "POST /users" do
        xit "creates a new user and lists all the users" do
          response = post("/users", username: "Edwin", email: "ed@foals.com")
          expect(response.status).to eq 200
          response = get("/users")
          expect(response_2.status).to eq 200
          expect(response_2.body).to include ('<h1>Chitter Users</h1>')
          expect(response_2.body).to include('Edwin')
          expect(response_2.body).to include('ed@foals.com')
        end
      end

      context "GET /users/:id" do
        xit "returns all the posts by user 1" do
          response = get('/users/1')
    
          expect(response.status).to eq 200
          expect(response.body).to include('<h1>Posts</h1>')
          expect(response.body).to include ('Title: Antidotes')
          expect(response.body).to include ('Post: math rocking glory')
          expect(response.body).to include ('Time: 2008-01-01 12:00:00')
        end
      end
end