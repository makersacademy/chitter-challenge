require 'spec_helper'
require 'rack/test'
require_relative '../../app'

def reset_peeps_users_tables
  seed_sql = File.read('schema/peeps_users_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  before do
    reset_peeps_users_tables
  end

  include Rack::Test::Methods
  let(:app) { Application.new }

  # Homepage: list of peeps
  context 'Homepage - GET / ' do
    before do
      @response = get('/')
    end
     
    it 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    it 'has "Chitter" as the title' do
      expect(@response.body).to include('<h1>Chitter</h1>')
    end

    it 'has a list of peeps' do
      expect(@response.body).to include('<a href="/peep/1">Just set up my chitter</a>')
      expect(@response.body).to include('<a href="/peep/2">RIP Uncle Phil</a>')
    end

    it 'peeps have the name and username of the maker' do
      expect(@response.body).to include('<p>Samuel Badru | <em>@sobad</em></p>')
      expect(@response.body).to include('<p>Jermaine Cole | <em>@j.cole</em></p>')
    end

    it 'has sign up and log in buttons when not logged in' do
      expect(@response.body).to include('<a class="btn btn-primary"  href="/login" role="button">Log in</a>')
      expect(@response.body).to include('<a class="btn btn-primary" href="/signup"  role="button">Sign up</a>')
    end

    it 'has peep and log out buttons when logged in' do
      post('login', email_username: 'aubreygraham@gmail.com', password: 'hotlinebling')
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_response.body).to include('<a class="btn btn-primary" href="/logout"  role="button">Log out</a>')
      expect(last_response.body).to include('<a class="btn btn-primary" href="/peep"  role="button"><b>Peep</b></a>')
    end
  end

  context 'Log in page - GET /login' do
    before do
      @response = get('/login')
    end
    
    it 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    it 'has an email/username input field' do
      expect(@response.body).to include('<input class="form-control" name="email_username" id="email_username" placeholder="Enter email or username">')
    end

    it 'has a password field' do
      expect(@response.body).to include('<input type="password" class="form-control" name="password" id="password" placeholder="Password">')
    end

    it 'has a login button' do
      expect(@response.body).to include('<input class="btn btn-primary" type="submit" value="Log in">')
    end

    it 'has a link to sign up' do
      expect(@response.body).to include('<a href="/signup">Sign up</a>')
    end
  end

  context 'GET /logout' do
    before do
      @response = get('/logout')
    end
    
    it 'is a valid web query that redirects the user' do
      expect(@response.status).to eq (302)
    end

  end

  context 'Sign up page - GET /signup' do
    before do
      @response = get('/signup')
    end
    
    it 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    it 'has an input field for email' do
      expect(@response.body).to include('<input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" placeholder="Email address">')
    end

    it 'has an input field for password' do
      expect(@response.body).to include('<input type="password" class="form-control" name="password" id="password" placeholder="Password">')
    end

    it 'has an input field for name' do
      expect(@response.body).to include('<input class="form-control" name="name" id="name" placeholder="Full name">')
    end

    it 'has an input field for username' do
      expect(@response.body).to include('<input class="form-control" name="username" id="username" placeholder="Username">')
    end

    it 'has a sign up submit button' do
      expect(@response.body).to include('<input class="btn btn-primary" type="submit" value="Sign up">')
    end

    it 'has a link to login' do
      expect(@response.body).to include('<a href="/login">Log in</a>')
    end
  end

  context 'Make a peep page - GET /peep' do
    before do
      @response = get('/peep')
    end
    
    it 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    it 'has an input field for the peep' do
      expect(@response.body).to include('<textarea class="form-control" rows="3" name="content" id="peep" placeholder="Make a peep!"></textarea>')
    end

    it 'has a peep submit button' do
      expect(@response.body).to include('<input class="btn btn-primary" type="submit" value="Peep">')
    end
  end

  context 'Peep info page - GET /peep/:id' do
    before do
      @response = get('/peep/1')
    end
    
    it 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    it 'has the date of the peep' do
      expect(@response.body).to include('<p>Date: ')
    end

    it 'has the time of the peep' do
      expect(@response.body).to include('<p>Time: ')
    end

    it 'peeps have the name and username of the maker' do
      expect(@response.body).to include('<p>Samuel Badru | <em>@sobad</em></p>')
    end
  end

  context 'POST /peep' do
    before do
      post('/login', email_username: "samuelbadru@outlook.com", password: 'makersforlife')
      @response = post('/peep', content: "My second peep")
    end
    
    it 'is a valid web query' do
      expect(@response.status).to eq (302)
    end

    it 'shows the new peep on the homepage' do
      follow_redirect!
      expect(last_response.body).to include ('<a href="/peep/7">My second peep</a>')
    end
  end

  context 'POST /login' do
    before do
      @response = post('/login', email_username: "samuelbadru@outlook.com", password: 'makersforlife')
    end
    
    it 'is redirects the user to another page' do
      expect(@response.status).to eq (302)
    end

    it 'shows the logged in version of the homepage' do
      follow_redirect!
      expect(last_response.body).to include('<a class="btn btn-primary" href="/logout"  role="button">Log out</a>')
      expect(last_response.body).to include('<a class="btn btn-primary" href="/peep"  role="button"><b>Peep</b></a>')
    end
  end

  context 'POST /signup' do
    before do
      @response = post('/signup', email: "santandave@icloud.com", password: 'psychodrama', name: 'Santan Dave', username: 'dave')
    end
    
    it 'is a valid web query that redirects the user' do
      expect(@response.status).to eq (302)
    end

  end
  
end