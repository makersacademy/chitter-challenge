require 'spec_helper'
require 'rack/test'
require_relative '../../app'


def reset_tables
  seed_sql = File.read('spec/seeds/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test'})
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do
    reset_tables
  end

  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /' do
    it 'outputs the index page with peeps' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Peeps</h1>')
      expect(response.body).to include('Have you seen my new kitty-cat? She is adorable!')
      expect(response.body).to include('By: cute-cat')
      expect(response.body).to include('At:')
      expect(response.body).to include('I am back from the dead and stronger than ever.')
    end
  end

  context 'GET /signin' do
    it 'returns the form page to sign in to chitter' do
      response = get('/signin/maker')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/signin" method="POST">')
      expect(response.body).to include('<input type="text" name="name" required pattern="^[\w\-\s]+$">')
      expect(response.body).to include('<input type="text" name="username"')
      expect(response.body).to include('<input type="text" name="email"')
      expect(response.body).to include('<input type="password" name="password" id="myInput" required pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$">')
    end
  end

  context 'POST /signin' do
    it 'returns a success page' do
      response = post(
        '/signin',
        name: 'Saphire',
        username: 'sea-shell',
        email: 'email2@email.com',
        password: '12345000a'
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('Thank you for signing up to Chitter!')
      expect(response.body).to include("<a href='/'>Go back to the main page</a>")
    end
  end

  context 'POST /signin' do
    it 'returns an error page if username already exists' do
      response = post(
        '/signin',
        name: 'Andy',
        username: 'cute-cat',
        email: 'email2@email.com',
        password: '12345000a'
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('This username is already in use, please choose a different one :)')
      expect(response.body).to include("<a href='/signin/maker'>Go back to signin page</a> ")
    end
  end

  context 'POST /signin' do
    it 'returns an error page if email already exists' do
      response = post(
        '/signin',
        name: 'Andy',
        username: 'tiredoftests',
        email: 'ameth22@gmail.com',
        password: '12345000a'
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('This email is already in use, please choose a different one :)')
      expect(response.body).to include("<a href='/signin/maker'>Go back to signin page</a> ")
    end
  end

  context 'get/write_peep' do
    it 'returns the form page to create a new peep' do
      response = get('/write_peep/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/write_peep" method="POST">')
      expect(response.body).to include('<input type="text" style="height:200px; width:600px;" name="content" required pattern="^[\.a-zA-Z0-9,!? ]*$">')
      expect(response.body).to include('<input type="text" name="username" required pattern="^[\w\-\s]+$">')
    end
  end

  context 'POST /write_peep' do
    it 'returns a success page' do
      maker_repo = MakerRepository.new
      fake_maker = double(name:'David', username:'eagle-man', email:'email@emal.com', password:'22212dddd', loggedin: true)
      maker_repo.create(fake_maker)
      
      response = post(
        '/write_peep',
        username: 'eagle-man',
        content: 'Another beautiful day in this countryside house.'
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('Thank you, your Peep has been successfully created!')
      expect(response.body).to include("<a href='/'>Go back to the main page</a>")
    end


    it 'returns an error page if username doesn\'t exist' do
      response = post(
        '/write_peep',
        username: 'cute-cat2',
        content: 'Another beautiful day in this countryside house.'
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('Username not found, please sign-up to Chitter if you want to post a Peep!')
      expect(response.body).to include("<a href='/'>Go back to the main page</a>")
    end

    it 'returns an error page if Maker not logged in' do
      response = post(
        '/write_peep',
        username: 'cute-cat',
        content: "Something, something"
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('You are not logged-in! Please, log-in if you would like to write a Peep.')
      expect(response.body).to include("<a href='/signin/maker'>Go back to signin page</a> ")
    end
  end
end

