require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_chitter_table
  seed_sql = File.read('spec/seeds/seeds_chitter_database_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do 
    reset_chitter_table
  end
  
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET to '/'" do
    it "returns 200 and all the peeps with the name and username of their creators" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("<head><h1>CHITTER</h1></head>")
      expect(response.body).to include("<head><h2>makers chit chat</h2></head>")
      expect(response.body).to include("<a href='/signup'> SIGN UP </a><br/>")
      expect(response.body).to include("<a href='/login'> LOG IN </a><br/><br/>")
      expect(response.body).to include("<p>Anna @anna123 at 2004-10-19 10:23:54</p>")
      expect(response.body).to include("<p>I love sunshine</p>")
      expect(response.body).to include("<p>John @john123 at 2004-10-19 10:00:54</p>")
      expect(response.body).to include("<p>I like cats</p>")
      expect(response.body).to include("<div>","</div>")
    end
  end

  context "GET to /signup" do
    it "returns the HTML form to create a new user" do
      response = get('/signup')
      expect(response.status).to eq(200)
      expect(response.body).to include("<form method='POST' action='/new_user'>")
      expect(response.body).to include("<input type='text' name='name'/>")
      expect(response.body).to include("<input type='text' name='username'/>")
      expect(response.body).to include("<input type='text' name='email'/>")
      expect(response.body).to include("<input type='text' name='password'/>")
    end
  end

  context "POST /new_user" do
    it 'creates a new user and returns 200 OK' do
      response = post(
        '/new_user', 
        name: 'Joanna', 
        username: 'joanna123', 
        email: 'joannaMccain@makersacademy.com',
        password: 'er4gg@$34tfsd'
      )
      users = UserRepository.new.all
      expect(response.status).to eq(200)
      expect(response.body).to include('<p>Welcome to CHITTER, Joanna!</p>')
      expect(response.body).to include("<a href='/new_peep'>share your thoughts with other Makers here</a>")
      response = get('/')
      expect(users).to include(
        have_attributes(email: 'joannaMccain@makersacademy.com')
      )
    end

    it 'fails to creates a user as the email already exists in the database' do
      response = post(
        '/new_user', 
        name: 'Joanna', 
        username: 'joanna123', 
        email: 'anna@makersacademy.com',
        password: 'er4gg@$34tfsd'
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('<p>Hi Joanna, this email has already been registered.</p>')
      expect(response.body).to include("<p>Please review your details:</p>")
      expect(response.body).to include("<form method='POST' action='/new_user'>")
    end

    it 'fails to creates a user as the username already exists in the database' do
      response = post(
        '/new_user', 
        name: 'Joanna', 
        username: 'anna123', 
        email: 'new_email@makersacademy.com',
        password: 'er4gg@$34tfsd'
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('<p>Hi Joanna, username anna123 is already in use. Please choose a different one.</p>')
      expect(response.body).to include("<p>Please review your details:</p>")
      expect(response.body).to include("<form method='POST' action='/new_user'>")
    end

    it 'fails to create a new user if the name is invalid' do
      response = post(
        '/new_user', 
        name: 'Jo12anna', 
        username: 'joanna123', 
        email: 'joannaMccain@makersacademy.com',
        password: 'er4gg@$34tfsd'
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include('<p>Your name seems to be incorrect.</p>')
      expect(response.body).to include('<p>Please review your details:</p>')
    end

    xit 'fails to create a new user if the username is invalid' do
      response = post(
        '/new_user', 
        name: 'Joanna', 
        username: 'jo&ann* a123', 
        email: 'joannaMccain@makersacademy.com',
        password: 'er4gg@$34tfsd'
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include('<p>Your username can only contain letters and numbers, and must be between 5 and 16 characters long.</p>')
      expect(response.body).to include('<p>Please review your details:</p>')
    end

    it 'fails to create a new user if the email is invalid' do
      response = post(
        '/new_user', 
        name: 'Joanna Jones', 
        username: 'joanna123', 
        email: 'joannaMccainmakersacademy.com',
        password: 'er4gg@$34tfsd'
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include("<p>Please use your Makers' email to create a Chitter account.</p>")
      expect(response.body).to include('<p>Please review your details:</p>')
    end

    it 'fails to create a new user if the email is not a Makers email' do
      response = post(
        '/new_user', 
        name: 'Joanna Jones', 
        username: 'joanna123', 
        email: 'joannaMccain@hotmail.com',
        password: 'er4gg@$34tfsd'
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include("<p>Please use your Makers' email to create a Chitter account.</p>")
      expect(response.body).to include('<p>Please review your details:</p>')
    end

    it 'fails to create a new user if the email is invalid - name check' do
      response = post(
        '/new_user', 
        name: 'Joanna Jones', 
        username: 'joanna123', 
        email: 'joannaMcca3525!!in@makersacademy.com',
        password: 'er4gg@$34tfsd'
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include("<p>Please use your Makers' email to create a Chitter account.</p>")
      expect(response.body).to include('<p>Please review your details:</p>')
    end

    it 'fails to create a new user if any of the parameters is missing' do
      response = post(
        '/new_user', 
        name: '', 
        username: 'joanna123', 
        email: 'joannam@makersacademy.com',
        password: 'er4gg@$34tfsd'
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include("<p>Some essential information is missing.</p>")
      expect(response.body).to include('<p>Please review your details:</p>')
    end
  end
end
