require "./spec/spec_helper.rb"
require "rack/test"
require_relative '../../app'

describe Application do
 
  include Rack::Test::Methods

  let(:app) { Application.new }

    context "GET /" do
        it "returns the homepage" do
            response = get('/')
            expect(response.status).to eq(200)
            expect(response.body).to include("Chitter")
        end
    end

    context "GET /peeps" do
        it "returns a list of peeps in reverse order" do
            response = get('/peeps')
            expect(response.status).to eq(200)
            expect(response.body).to include('<h1> Peeps </h1>')
            expect(response.body).to include('<div> message5  </div>')
        end 
    end

    context "GET /peeps/new" do
        it "returns form for making a new peep" do
            response = get('/peeps/new')

            expect(response.status).to eq(200)
            expect(response.body).to include("<h1>Make a peep</h1>")
        end
    end

    context "GET /signup" do
        xit "returns form to sign up for chitter" do
            response = get('/signup')

            expect(response.status).to eq(200)
            expect(response.body).to include("<h1>Create Account </h1>")
            expect(response.body).to include("<input type='text' name='name'/>")
        end
    end

    context 'POST /signup' do
        it "should create an account" do
            response = post(
                '/signup',
                 name: 'James',
                 username: 'James123',
                 email: 'James@gmail.com',
                 password:'xxxx')

            expect(response.status).to eq(200)
            expect(response.body).to include("<div><h2>Your account has been created</h2></div>")
        end
    end










end