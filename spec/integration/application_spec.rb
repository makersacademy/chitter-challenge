require "spec_helper"
require "rack/test"
require_relative "../../app"
require "user_repository"

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
  let(:session_params) { { 'rack.session' => { username: "tcarmichael", user_id: 1 } } }
  let(:freeze_time) { allow(Time).to receive(:now).and_return(Time.new(2099, 9, 1, 10, 5, 0)) }

  describe "homepage" do 
    it "displays all peeps in reverse chronological order" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to match(/Big Brother is watching you @wsmith[\s\S]*@wsmith & @smhanna - this is jam hot, this is jam hot[\s\S]*We shall meet in the place where there is no darkness/)
    end
    it "displays the peep author's name and username" do
      response = get('/')
      expect(response.body).to include("@tcarmichael (Tom Carmichael-Mhanna) wrote:")
      expect(response.body).to include("@smhanna (Sarwah Mhanna) wrote:")
    end
    it "displays the peep's timestamp" do
      response = get('/')
      expect(response.body).to match(/Posted: 2022-12-19 10:23:54[\s\S]*Posted: 1984-06-15 14:33:00/)
    end
    it "displays a Chitter logo" do
      response = get('/')
      expect(response.body).to include("<img src='/chitter-low-resolution.png' alt='Chitter logo'")
    end

    context "when the user is logged in" do
      it "displays the form to post a new peep" do
        # No query params, but session object is simulated
        response = get('/', {}, session_params)
        expect(response.status).to eq(200)
        expect(response.body).to include('<form method="POST" action="/peep">')
        expect(response.body).to include('<label for="message">Compose new peep...</label>')
        expect(response.body).to include('<input type="text" name="message" />')
      end
      it "doesn't display a link to login" do
        response = get('/', {}, session_params)
        expect(response.status).to eq(200)
        expect(response.body).not_to include('<a href="/login">Login</a')
      end
      it "displays a link to logout" do
        response = get('/', {}, session_params)
        expect(response.status).to eq(200)
        expect(response.body).to include('<form method="post" action="/logout" class="inline"')
        expect(response.body).to include('<button type="submit" name="logout" class="link-button">Logout</button>')
      end
    end

    context "when the user isn't logged in" do
      it "displays a link to login" do
        response = get('/')
        expect(response.status).to eq(200)
        expect(response.body).to include('<a href="/login">Login</a>')
      end
      it "displays a link to register" do
        response = get('/')
        expect(response.status).to eq(200)
        expect(response.body).to include('<a href="/register">Register</a>')
      end
      it "doesn't display the form to create a new peep" do
        response = get('/')
        expect(response.status).to eq (200)
        expect(response.body).not_to include('<form method="POST" action="/peep">')
        expect(response.body).not_to include('<input type="text" name="message" />')
      end
    end
  end
  ###########################
  describe "POST /peep" do
    it "Redirects user to homepage and displays the new peep at the top" do
      freeze_time
      form_params = { message: "Conspiracy uncovered! The sun is flat." }
      response = post('/peep', form_params, session_params)
      expect(response.status).to eq(302)
      follow_redirect!
      expect(last_request.path).to eq('/')
      response = get('/')
      expect(response.body).to match(/@tcarmichael \(Tom Carmichael-Mhanna\) wrote:[\s\S]*Conspiracy uncovered! The sun is flat.[\s\S]*2099-09-01 10:05:00[\s\S]*Big Brother/)
    end
    it "sanitizes user input against potentially malicious tags" do
      js_rick_roll = '<script>document.location.href="https://www.youtube.com/watch?v=34Ig3X59_qA";</script>'
      form_params = { message: js_rick_roll }
      response = post('/peep', form_params, session_params)
      expect(response).to be_redirect
      follow_redirect!
      expect(last_response.body).to include('&lt;script&gt;document.location.href=&quot;https://www.youtube.com/watch?v=34Ig3X59_qA&quot;;&lt;/script&gt;')
    end
    it "detects a tag within peep and records it in the DB" do
      session_params = { 'rack.session' => { username: "smhanna", user_id: 2 } }
      form_params = { message: "Hello @tcarmichael" }
      response = post('/peep', form_params, session_params)
      expect(response.status).to eq(302)
      response = get('/')
      expect(response.body).to include("Hello @tcarmichael")
      tags = TagRepository.new.all
      expect(tags.length).to eq 4
      expect(tags.last.peep_id).to eq 4
      expect(tags.last.user_id).to eq 1
    end
    it "detects 2 tags within peeps and records them in the DB" do
      session_params = { 'rack.session' => { username: "smhanna", user_id: 2 } }
      form_params = { message: "Hello @tcarmichael check out the photos from @wsmith!" }
      response = post('/peep', form_params, session_params)
      expect(response.status).to eq(302)
      response = get('/')
      expect(response.body).to include("Hello @tcarmichael check out the photos from @wsmith!")
      tags = TagRepository.new.all
      expect(tags.length).to eq 5
      expect(tags.last.peep_id).to eq 4
      expect(tags.last.user_id).to eq 3
      expect(tags[-1].peep_id).to eq 4
      expect(tags[-1].user_id).to eq 3
    end

    context "given {message: ""}" do
      it "returns 400 & error message" do
        response = post('/submit_register', { message: "" }, session_params)
        expect(response.status).to eq(400)
        expect(response.body).to include("Invalid form parameters entered, please rety and ensure you fill out all fields.")
      end
    end
    context "given {message: nil}" do
      it "returns 400 & error message" do
        response = post('/submit_register', { message: nil }, session_params)
        expect(response.status).to eq(400)
        expect(response.body).to include("Invalid form parameters entered, please rety and ensure you fill out all fields.")
      end
    end
  end
  ########
  describe "POST /logout" do
    context "When user is logged in" do
      it "logs them out & redirects to GET '/'" do
        response = post('/logout', {}, session_params)
        expect(response.status).to eq(302)
        follow_redirect!
        expect(last_request.path).to eq('/')
        expect(last_request.env['rack.session'][:user_id]).to be_nil
        expect(last_request.env['rack.session'][:username]).to be_nil
      end
    end
  end 
  ########################
  describe "GET /login" do
    context "when the user is logged in" do
      it "redirects to '/'" do
        response = get('/login', {}, session_params)
        expect(response.status).to eq(302)
        follow_redirect!
        expect(last_request.path).to eq('/')
      end
    end
    context "when the user isn't logged in" do
      it "displays a login form" do
        response = get('/login')
        expect(response.status).to eq 200
        expect(response.body).to include('<form method="POST" action="/login_attempt">')
        expect(response.body).to include('<label for="username">Username:</label>')
        expect(response.body).to include('<input type="text" name="username" />')
        expect(response.body).to include('<label for="password">Password:</label>')
        expect(response.body).to include('<input type="password" name="password" />')
      end
    end
  end
  #################################
  describe "POST /login_attempt" do
    context "if the user is already logged in" do
      it "redirects to '/'" do
        response = post('/login_attempt', { username: 'jimbob', password: 'abracadabra' }, session_params)
        expect(response.status).to eq(302)
        follow_redirect!
        expect(last_request.path).to eq('/')
      end
    end
    context "if the user isn't logged in" do
      context "and provides correct credentials" do
        it "logs the user in" do
          response = post('/login_attempt', { username: 'wsmith', password: 'bigbrother' })
          expect(response.status).to eq(302)
          follow_redirect!
          expect(last_request.path).to eq('/')
          # Check that the session object has been updated with the user's ID
          expect(last_request.env['rack.session'][:user_id]).to eq 3
          expect(last_request.env['rack.session'][:username]).to eq 'wsmith'
        end
      end
      context "and provides incorrect username" do
        it "returns an error page" do
          response = post('/login_attempt', { username: 'jay_dilla', password: 'bigbrother' })
          expect(response.status).to eq 401
          expect(response.body).to include('Login failed: invalid username')
          # Check that the session object has not been updated with user ID
          expect(last_request.env['rack.session'][:user_id]).to be_nil
        end
      end
      context "and provides incorrect password" do
        it "returns an error page" do
          response = post('/login_attempt', { username: 'wsmith', password: '1984' })
          expect(response.status).to eq 401
          expect(response.body).to include('Login failed: incorrect password')
          # Check that the session object has not been updated with the user's ID
          expect(last_request.env['rack.session'][:user_id]).to be_nil
        end
      end
    end
  end
  ###########################
  describe "GET /register" do
    context "if the user is logged in" do
      it "redirects to'/'" do
        response = get('/register', {}, session_params)
        expect(response.status).to eq(302)
        follow_redirect!
        expect(last_request.path).to eq('/')
      end
    end

    context "if the user isn't logged in" do
      it "displays the registration form" do
        response = get('/register')
        expect(response.status).to eq(200)
        expect(response.body).to include('<form method="POST" action="/submit_register">')
        expect(response.body).to include('<input type="text" name="username" />')
        expect(response.body).to include('<input type="password" name="password" />')
        expect(response.body).to include('<input type="text" name="name" />')
        expect(response.body).to include('<input type="text" name="email" />')
      end
    end
  end
  ################################
  describe "POST /submit_register" do
    context "if username doesn't already exist" do
      it "registers user" do
        response = post('/submit_register', { name: 'Dave Smith', username: 'prophet5', email: "sequential@circuits.com", password: 'polyphony' })
        expect(response.status).to eq(200)
        expect(response.body).to include('Congtratulations @prophet5, you successfully signed up for Chitter!')
        expect(response.body).to include("<a href='/login'>Login here</a> to start Chittering.")
        user = UserRepository.new.find_by_username('prophet5')
        expect(user).not_to be_nil
        expect(user.name).to eq('Dave Smith')
        expect(user.email).to eq('sequential@circuits.com')
      end
      context "if username already exists" do
        it "doesn't register user" do
          response = post('/submit_register', { name: 'name', username: 'tcarmichael', email: "email@email.com", password: 'password' })
          expect(response.status).to eq(200)
          expect(response.body).to include('username is already taken')
          expect(response.body).to include("<a href='/register'>Retry registration</a>")
          all_users = UserRepository.new.all
          expect(all_users.length).to eq 3
          expect(all_users.first.name).to eq "Tom Carmichael-Mhanna"
          expect(all_users.last.name).to eq "Winston Smith"
        end
      end
      context "if email already exists" do
        it "doesn't register user" do
          response = post('/submit_register', { name: 'name', username: 'username', email: "tomcarmichael@hotmail.co.uk", password: 'password' })
          expect(response.status).to eq(200)
          expect(response.body).to include('email is already taken')
          expect(response.body).to include("<a href='/register'>Retry registration</a>")
          all_users = UserRepository.new.all
          expect(all_users.length).to eq 3
          expect(all_users.first.email).to eq "tomcarmichael@hotmail.co.uk"
          expect(all_users.last.name).to eq "Winston Smith"
        end
      end
      context "given {name: nil}" do
        it "returns 400 & error message" do
          response = post('/submit_register', { name: nil, username: 'fake_username', email: "example@email.com", password: 'password' })
          expect(response.status).to eq(400)
          expect(response.body).to include("Invalid form parameters entered, please rety and ensure you fill out all fields.")
        end
      end
      context "given {password: nil}" do
        it "returns 400 & error message" do
          response = post('/submit_register', { name: nil, username: 'fake_username', email: "example@email.com", password: nil })
          expect(response.status).to eq(400)
          expect(response.body).to include("Invalid form parameters entered, please rety and ensure you fill out all fields.")
        end
      end
      context "given {username: ""}" do
        it "returns 400 & error message" do
          response = post('/submit_register', { name: "dave", username: '', email: "example@email.com", password: "test" })
          expect(response.status).to eq(400)
          expect(response.body).to include("Invalid form parameters entered, please rety and ensure you fill out all fields.")
        end
      end
    end
  end
end
