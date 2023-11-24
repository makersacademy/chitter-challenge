require "spec_helper"
require "rack/test"
require_relative '../../app'


def reset_test_database_tables
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before(:each) do 
    reset_test_database_tables
  end

  # ------------- Homepage Route ----------------------------------------

  context 'Homepage Route: ' do
    it 'shows the two latest peeps' do
      response = get('/')
      expect(response.status).to eq 200

      expect(response.body).to include '<h3> This is the forth Peep </h3>'
      expect(response.body).to include '<h3> This is the third Peep </h3>'

    end
  end

  # ------------- Sign Up Routes ----------------------------------------

  context 'Sign Up Routes: ' do
    it 'displays a form with entries for name, email, username, password' do
      response = get('/signup')
      expect(response.status).to eq 200

      expect(response.body).to include '<form action="/signup" method="POST">'
    end

    it 'rejects a signup if an email address is already in the database' do
      response = post('/signup',
        name:'Test Name',
        email:'carolinesemail@email.com',
        username: 'testusername',
        password: 'test')
      expect(response.status).to eq 400

      expect(response.body).to include 'Email address already signed up.'
    end

    it 'rejects a signup if a username is already in the database' do
      response = post('/signup',
        name:'Test Name',
        email:'testemail@email.com',
        username: 'caro',
        password: 'test')
      expect(response.status).to eq 400
  
      expect(response.body).to include 'Username already taken, please choose another.'
    end

    it 'rejects a signup if the name includes special characters' do
      response = post('/signup',
        name:'TestName!',
        email:'testemail@email.com',
        username: 'testusername',
        password: 'test')
      expect(response.status).to eq 400
  
      expect(response.body).to include 'Invalid credentials, please try again.'
    end

    it 'rejects a signup if the username includes special characters' do
      response = post('/signup',
        name:'TestName',
        email:'testemail@email.com',
        username: 'testusername!',
        password: 'test')
      expect(response.status).to eq 400
  
      expect(response.body).to include 'Invalid credentials, please try again.'
    end

    it 'rejects a signup if the password is empty' do
      response = post('/signup',
        name:'TestName',
        email:'testemail@email.com',
        username: 'testusername!',
        password: '')
      expect(response.status).to eq 400
  
      expect(response.body).to include 'Invalid credentials, please try again.'
    end

    it 'rejects a signup if the email does not have an @ sign' do
      response = post('/signup',
        name:'TestName',
        email:'testemailemail.com',
        username: 'testusername',
        password: 'test')
      expect(response.status).to eq 400
  
      expect(response.body).to include 'Invalid credentials, please try again.'
    end

    it 'successfully adds a new user' do
      response = post('/signup',
        name:'TestName',
        email:'testemail@email.com',
        username: 'testusername1',
        password: 'test')
      
      expect(response.status).to eq 302
      expect(response.original_headers['Location']).to include '/userpage'
      
      users = UserRepository.new.all

      expect(users[2].id).to eq  3
      expect(users[2].name).to eq  'TestName'
      expect(users[2].email).to eq  'testemail@email.com'
      expect(users[2].username).to eq 'testusername1'
      expect(BCrypt::Password.new(users[2].password)).to eq 'test'

    end

  end

  # ------------- Peeps Routes ----------------------------------------

  context 'Peeps Routes' do
    it 'displays all peeps' do
      response = get('/peeps')
      expect(response.status).to eq 200

      expect(response.body).to include('<h3> This is the forth Peep </h3>')
      expect(response.body).to include('<h3> This is the third Peep </h3>')
      expect(response.body).to include('<h3> This is the second Peep </h3>')
      expect(response.body).to include('<h3> This is the first Peep </h3>')

    end

    it 'rejects a peep post if content is empty' do
      response = post('/peeps',
        content:'',
        user_id: 1)
      expect(response.status).to eq 400
  
      expect(response.body).to include 'Invalid peep, please try again.'
  
    end

    it 'creates a new peep' do
      response = post('/peeps',
        content:'Test Peep 1',
        user_id: 1)

      expect(response.status).to eq 200

      peeps = PeepRepository.new.all

      expect(peeps[4].id).to eq  5
      expect(peeps[4].content).to eq  'Test Peep 1'
      expect(peeps[4].user_id).to eq  1
    
    end

  end

 
  # ------------- User Page Routes ----------------------------------------

  context 'User Page Routes: ' do
    it 'rejects a log-in if password is empty' do
      response = post('/userpage',
        username:'caro',
        password: '')
      expect(response.status).to eq 400
  
      expect(response.body).to include 'Invalid user details.'

    end

    it 'rejects a log-in if password is wrong' do
      response = post('/signup',
        name:'TestName',
        email:'testemail@email.com',
        username: 'testusername1',
        password: 'test')
      
      response = post('/userpage',
        username:'testusername1',
        password: 'testing')
      expect(response.status).to eq 400
  
      expect(response.body).to include 'Invalid user details.'

    end

    it 'rejects a log-in if username is not in the database' do
      response = post('/userpage',
        username:'test',
        password: 'testing')
      expect(response.status).to eq 400
  
      expect(response.body).to include 'Username does not exist, please try again.'

    end

    it 'redirects the user on a successful log-in' do
      response = post('/signup',
        name:'TestName',
        email:'testemail@email.com',
        username: 'testusername1',
        password: 'test')
      
      response = post('/userpage',
        username:'testusername1',
        password: 'test')
      expect(response.status).to eq 302
    end


  end


end