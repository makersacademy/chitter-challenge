require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  def reset_users_table
    seed_sql = File.read('spec/seeds/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  def reset_peeps_table
    seed_sql = File.read('spec/seeds/seeds_peeps.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_users_table
    reset_peeps_table
  end

  context "GET /peeps" do
    it 'returns a list of peeps' do
      response = get("/peeps")

      expect(response.status).to eq(200)
      expect(response.body).to include("<div><a href='/peeps/1'>Cats")
      expect(response.body).to include("<div><a href='/peeps/3'>Animals")
    end
  end

  context "GET /peeps/new" do
    it 'returns an html form to create a new peep' do
      response = get('/peeps/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/peep">')
      expect(response.body).to include('input type="text" name="title"')
    end
  end

  context "GET /users/new" do
    it 'returns an html form to create a new user' do
      response = get('/users/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/user">')
      expect(response.body).to include('input type="text" name="name"')
    end
  end

  context "GET /login" do
    it 'returns the login page' do
      response = get('/login')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Enter your details to login!</h1>')
    end
  end

  context "POST /peep" do
    it 'creates a peep and returns a confirmation page' do
      response = post('/peep', title: "my_peep", content: "my_content")

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Peep created!: my_peep</h1>')
    end

    it 'creates a peep with different content and returns a confirmation page' do
      response = post('/peep', title: "a_different_peep", content: "different_content")

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Peep created!: a_different_peep</h1>')
    end
  end

  context "POST /user" do
    it 'creates a user and returns a confirmation page' do
      response = post('/user', name: "my_name", username: "my_username", email: 'my_email', password: 'my_password')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>User created!: my_username</h1>')
    end
  end

  context "POST /login" do
    it 'authenticates a user and returns a confirmation page' do
      response = post('/login', email: 'my_email@chittermail.com', password: 'my_password')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Welcome! Sign-in successful</h1>')
    end

    xit 'authenticates a user and returns an error page when login details are incorrect' do
      response = post('/login', email: 'my_email@chittermail.com', password: 'not_my_password')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Error! Please try again</h1>')
    end
  end
end