require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }


  def reset_both_tables
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end
  
  
  before(:each) do 
    reset_both_tables
  end

  context "GET /" do
    it "homepage" do
      response = get('/')

      expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
      expect(response.body).to include('<a href="/users/new">here</a>.')
    end
  end

  context "GET /peeps/new" do
    it "returns the form page" do
      response = get('/peeps/new')

      expect(response.status).to eq(302)

      # expect(response.body).to include('<form method="POST" action="/peeps">')
      # expect(response.body).to include('<input type="text" name="content" /><br />')
    end
  end

  context "POST /peeps" do
    it "post new peep to database" do
      response = post('/peeps', content: "New peep", name: "David")
      
      expect(response.body).to include('<h3>Peep sent! Click <a href="/peeps">here</a> to see what other Chitter users are saying.</h3>')
    end
  end

  context "GET /peeps" do
    it "returns peeps in reverse chronological order and link to user pages" do
      response = get('/peeps')

      expect(response.status).to eq(200)

      expect(response.body).to include('<h1>Peeps</h1>')
      expect(response.body).to include('<p>peep 1</p>')
      expect(response.body).to include('<p>peep 2</p>')

      expect(response.body).to include('<a href="/users/2">')
      expect(response.body).to include('<a href="/users/1">')
    end
  end

  context "GET /users/new" do
    it "gets create new user page" do
      response = get('/users/new')

      expect(response.body).to include('<input type="text" name="name" /><br />')
      expect(response.body).to include('<input type="text" name="email_address" /><br />')
    end
  end

  context "POST /users" do
    it "creates new user" do
      response = post('/users', name: 'marinapapap', email: 'notreal@email.com')

      expect(response.body).to include('<h1>Welcome to the chitter community!</h1>')
    end
  end

  context "GET /users/:id" do
    it "returns page of peeps from one user" do
      response = get('users/1')

      expect(response.body).to include '<h1>Peeps by David</h1>'
      expect(response.body).to include 'peep 1'
    end
  end

  context "GET /login" do
    it "returns the login page" do
      response = get('/login')

      expect(response.body).to include('<input type="text" name="email_address" /><br />')
      expect(response.body).to include('<input type="text" name="password" /><br />')
    end
  end

  context "POST /login" do
    it "logs the user into a session" do
      response = post('/login', name: "David", email_address: 'email_1@yahoo.co.uk', password: '##^%$&^$#')

      expect(response.body).to include("<a href='/peeps/new'><p>start chittering</p></a>")
    end
  end

  context "GET /logout" do
    it "logs the user out" do
      response = get('/logout')

      expect(response.status).to eq(302)
    end
  end
end