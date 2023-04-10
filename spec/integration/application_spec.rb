require "spec_helper"
require "rack/test"
require_relative "../../app"

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect(host: '127.0.0.1', dbname: 'chitter_test')
  connection.exec(seed_sql)
end

describe Application do
  before :each do
    reset_tables
  end

  include Rack::Test::Methods

  let(:app) { Application.new }

  describe "homepage" do 
    it "displays all peeps in reverse chronological order" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to match(/Big Brother is watching you @wsmith[\s\S]*@wsmith & @smhanna - this is jam hot, this is jam hot[\s\S]*We shall meet in the place where there is no darkness/)
    end
    it "displays the peep author's name and username" do
      response = get('/')
      expect(response.body).to include("Author: @tcarmichael - Tom Carmichael-Mhanna")
      expect(response.body).to include("Author: @smhanna - Sarwah Mhanna")
    end
    it "displays the peep's timestamp" do
      response = get('/')
      expect(response.body).to match(/On 2022-12-19 10:23:54[\s\S]*On 1984-06-15 14:33:00/)
    end

    it "displays the peep's timestamp" do
      response = get('/')
      expect(response.body).to match(/On 2022-12-19 10:23:54[\s\S]*On 1984-06-15 14:33:00/)
    end

    context "when the user is logged in" do
      it "displays the form to post a new peep" do
        # No query params, but session object is simulated
        response = get('/', {}, { 'rack.session' => { username: "tcarmichael", user_id: 1 } } )
        expect(response.status).to eq(200)
        expect(response.body).to include('<form method="POST" action="/peep">')
        expect(response.body).to include('<label for="message">Peep away...!</label>')
        expect(response.body).to include('<input type="text" name="message" />')
      end
      it "doesn't display a link to login" do
        response = get('/', {}, { 'rack.session' => { username: "tcarmichael", user_id: 1 } } )
        expect(response.status).to eq(200)
        expect(response.body).not_to include('<a href="/login">Login</a')
      end
    end

    context "when the user is NOT logged in" do
      it "displays a link to login" do
        response = get('/')
        expect(response.status).to eq(200)
        expect(response.body).to include('<a href="/login">Login</a>')
      end
      it "doesn't display the form to create a new peep" do
        response = get('/')
        expect(response.status).to eq (200)
        expect(response.body).not_to include('<form method="POST" action="/peep">')
        expect(response.body).not_to include('<input type="text" name="message" />')
      end
    end
  end

  describe "login" do
    context "when user is already logged in" do
      it "redirects the user to the home page" do
        response = get('/login', {}, { 'rack.session' => { username: "tcarmichael", user_id: 1 } } )
        expect(response).to be_redirect
        follow_redirect!
        expect(last_request.path).to eq('/')
      end
    end
    context "when user is not logged in" do
      it "displays a form to log in" do
        response = get('/login')
        expect(response.status).to eq 200
        expect(response.body).to include('<form method="POST" action="/login_attempt">')
        expect(response.body).to include('<label for="username">Username:</label>')
        expect(response.body).to include('<input type="text" name="username" />')
        expect(response.body).to include('<label for="password">Password:</label>')
        expect(response.body).to include('<input type="text" name="password" />')
      end
    end
    context "after submitting the login form" do
      context "if the user is already logged in" do
        it "redirects the user to the home page" do
          response = post('/login_attempt', { username: 'jimbob', password: 'abracadabra' }, { 'rack.session' => { username: "tcarmichael", user_id: 1 } } )
          expect(response).to be_redirect
          follow_redirect!
          expect(last_request.path).to eq('/')
        end
      end
      context "if the user is NOT already logged in" do
        context "and provides correct credentials" do
          it "logs the user in" do
            response = post('/login_attempt', { username: 'wsmith', password: 'bigbrother' } )
            expect(response).to be_redirect
            follow_redirect!
            expect(last_request.path).to eq('/')
            # Check that the session object has been updated with the user's ID
            expect(last_request.env['rack.session'][:user_id]).to eq 3
            expect(last_request.env['rack.session'][:username]).to eq 'wsmith'

          end
        end
        context "and provides incorrect username" do
          it "returns an error page" do
            response = post('/login_attempt', { username: 'jay_dilla', password: 'bigbrother' } )
            expect(response.status).to eq 401
            expect(response.body).to include('Login failed: username not found')
            # Check that the session object has been updated with the user's ID
            expect(last_request.env['rack.session'][:user_id]).to be_nil
          end
        end
        context "and provides incorrect password" do
          it "returns an error page" do
            response = post('/login_attempt', { username: 'wsmith', password: '1984' } )
            expect(response.status).to eq 401
            expect(response.body).to include('Login failed: incorrect password')
            # Check that the session object has been updated with the user's ID
            expect(last_request.env['rack.session'][:user_id]).to be_nil
          end
        end
      end
    end
  end
end