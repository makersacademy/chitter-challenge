require "spec_helper"
require "rack/test"
require 'mail'
require_relative '../../app'

def reset_users_table
    seed_sql = File.read('spec/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end

describe Application do
    include Rack::Test::Methods
    let(:app) { Application.new }

    before(:each) do
        reset_users_table
      end 
  
    context "GET to /" do
      it "returns 200 OK with the right content" do
        response = get("/")
  
        # Assert the response status code and body.
        expect(response.status).to eq(200)
        expect(response.body).to include('Welcome to Chitter')
      end
    end

    context "GET /peeps" do
      it "returns a list of all peeps" do
        response = get('/peeps')
        expect(response.body).to include('  <a href="/peeps/1">Do the solo chitter project</a><br />')
        expect(response.body).to include('  <a href="/peeps/2">Do the shop mamnager project</a><br />')
      end
    end

    context 'GET /peeps/:id' do
      it 'returns the time at which peep was made' do 
        response = get('/peeps/1')
        expect(response.status).to eq(200)
        expect(response.body).to include('Do the solo chitter project')
        expect(response.body).to include('2023-01-08 10:05:06')
      end
    end

    context 'GET /sign_up' do
        it 'should return a form to create a new user' do 
            response = get('/sign_up')
            expect(response.status).to eq(200)
            expect(response.body).to include('<h1>Create a new user</h1>')
            expect(response.body).to include('form action="/sign_up" method="POST">')
          end
    end

    context 'GET /log_in' do
        it 'should return a form to fill the log in information' do 
            response = get('/log_in')
            expect(response.status).to eq(200)
            expect(response.body).to include('<h1 id="login-header">Login</h1>')
            expect(response.body).to include('form action="/log_in" method="POST">')
          end
    end

    context 'GET /new_peep' do
        it 'should return a form to create a new peep' do 
            response = get('/new_peep')
            expect(response.status).to eq(200)
            expect(response.body).to include("<h2>What's in your mind?</h2>")
            expect(response.body).to include('form action="/new_peep" method="POST">')
          end
    end

end
