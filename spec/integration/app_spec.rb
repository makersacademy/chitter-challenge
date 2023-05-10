require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_chitters_table
  seed_sql = File.read('spec/seeds_chitters.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

RSpec.describe Application do
  before(:each) do 
    reset_chitters_table
  end

  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /chitters" do
    it 'returns a list of chitters in html' do
      response = get('/chitters')

      expect(response.status).to eq(200)
      expect(response.body).to include('smorg')
      expect(response.body).to include('dead')
      expect(response.body).to include('falling')
      expect(response.body).to include('flying solo')
      expect(response.body).to match(/Time: \d{2}-\d{2} \d{2}:\d{2}:\d{2}/)
    end
  end

  context "POST /chitters" do
    it 'returns 200 OK' do
      response = post(
        '/chitters',
        peep: 'Spaghetti',
        created_at: Time.now
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include('Spaghetti has been added')

      get_chitters = get('/chitters')

      expect(get_chitters.body).to include('Spaghetti')
    end
  end

  context 'GET /chitters/new' do
    it 'returns a new chitter form page' do
      post(
        '/log-in',
        email: 'chonky@chonkersacademy.com',
        password: 'birdwird'
      )
      response = get("/chitters/new")

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/chitters">')
      expect(response.body).to include('<input type="text" name="peep" />')
    end
  end

  context "GET /users" do
    it 'returns a list of users in html' do
      response = get('/users')

      expect(response.status).to eq(200)
      expect(response.body).to include('sjmog')
      expect(response.body).to include('smorg')
      expect(response.body).to include('TZ')
    end
  end

  context 'get /sign-up' do
    it 'returns a chitter sign-up page' do
      response = get('/sign-up')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/sign-up">')
      expect(response.body).to include('<input type="email" name="email" required />')
      expect(response.body).to include('<input type="password" name="password" required />')
      expect(response.body).to include('<input type="text" name="name" required />')
      expect(response.body).to include('<input type="text" name="username" required />')
    end
  end

  context "POST /sign-up" do
    it 'returns 200 OK' do
      response = post(
        '/sign-up',
        email: 'asdasd@makers.make',
        password: 'asdasd',
        name: 'Donny Brasco',
        username: 'Donno99'
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include('Donno99 has been added')

      get_users = get('/users')

      expect(get_users.body).to include('Donno99')
    end

    it 'finds that the username or email already exist and asks to re-enter' do
      response = post(
        '/sign-up',
        email: 'sleepy@sleepersacademy.com',
        password: 'zzzzzz',
        name: 'asdasd',
        username: 'TZ'
      )
      
      expect(response.status).to eq(302)

      get_users = get('/users')

      expect(get_users.body).not_to include('asdasd')
    end
  end

  context 'get /log-in' do
   it 'returns a chitter log-in page' do
      response = get('/log-in')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/log-in">')
      expect(response.body).to include('<input type="email" name="email" required />')
      expect(response.body).to include('<input type="password" name="password" required />')
    end
  end

  context "POST /log-in" do
    it 'checks if passwords match and logs-in' do
      response = post(
        '/log-in',
        email: 'chonky@chonkersacademy.com',
        password: 'birdwird'
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include('You logged in, Nice One!!')
    end

    it 'checks if passwords match and returns error page when they dont' do
      response = post(
        '/log-in',
        email: 'chonky@chonkersacademy.com',
        password: 'blah'
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include('Incorrect email or password')
    end
  end

  context "POST /" do
    it 'logs user out' do
      response = post(
        '/'
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include('log-in')
    end
  end

  it 'responds with 400 status if peep parameters are invalid' do
    response = post('/chitters', peep: '')
    response_2 = post('/chitters', peep: '<script>somethingsomething</script>')

    expect(response.status).to eq(400)
    expect(response.body).to include('')
    expect(response_2.status).to eq(400)
    expect(response_2.body).to include('')
  end

  it 'responds with 400 status if sign-up parameters are invalid' do
    response = post('/sign-up', name: '')
    response_2 = post('/sign-up', username: nil)

    expect(response.status).to eq(400)
    expect(response.body).to include('')
    expect(response_2.status).to eq(400)
    expect(response_2.body).to include('')
  end

  it 'responds with 400 status if log-in parameters are invalid' do
    response = post('/log-in', email: nil)
    response_2 = post('/log-in', password: '<script>somethingsomething</script>')

    expect(response.status).to eq(400)
    expect(response.body).to include('')
    expect(response_2.status).to eq(400)
    expect(response_2.body).to include('')
  end
end