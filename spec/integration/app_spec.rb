# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
    # This is so we can use rack-test helper methods.
    include Rack::Test::Methods

    # We need to declare the `app` value by instantiating the Application
    # class so our tests work.
    let(:app) { Application.new }
    def reset_reposes
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
        connection.exec(seed_sql)
    end
    before(:each) do
        reset_reposes
    end

    # test GET routes
    context "GET to /" do
        it "returns 200, body contains a peep" do
            response = get("/")
            expect(response.status).to eq(200)
            expect(response.body).to include('<p class="peep-message">My first peep!</p>')
        end
    end
    context "GET to /post" do
        it "returns 302, as it should redirect to login page" do
            response = get("/post")
            expect(response.status).to eq(302)
        end
    end
    context "GET to /login" do
        it "returns 200, should contain a form" do
            response = get("/login")
            expect(response.status).to eq(200)
            expect(response.body).to include('<form action="/login" method="post">')
        end
    end
    context "GET to /peep/1" do
        it "returns 200, should present a specific peep" do
            response = get("/peep/1")
            expect(response.status).to eq(200)
            expect(response.body).to include('<p class="peep-message">My first peep!</p>')
        end
    end
    
    # test POST routes
    context "POST to /login" do
        it "returns 200, should reject due to incorrect password" do
            response = post('/login', email: 'samm@makersacademy.com', password: 'wrongpassword')
            expect(response.status).to eq(200)
            expect(response.body).to include('Incorrect email or password.')
        end
    end
    context "POST to /login" do
        it "returns 200, should login user and redirect" do
            response = post(
                '/login',
                email: 'samm@makersacademy.com',
                password: 'password123'
            )
            expect(response.status).to eq(302)
        end
    end
    context "POST to /register" do
        it "returns 200, should reject due to the email already being registered" do
            response = post(
                '/register',
                email: 'samm@makersacademy.com',
                password: 'password123',
                name: 'Sam Morgan',
                username: 'sjmog'
            )
            expect(response.status).to eq(200)
        end
    end
    context "POST to /register" do
        it "returns 302, should register user and redirect to page" do
            response = post(
                '/register',
                email: 'janedoe@example.com',
                password: 'anotherpassword',
                name: 'Jane Doe',
                username: 'jadoe'
            )
            expect(response.status).to eq(302)
        end
    end
end