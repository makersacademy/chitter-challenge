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

    xit 'has peep and log out buttons when logged in' do
      login = post('login', email_username: 'aubreygraham@gmail.com', password: 'hotlinebling')

      expect(@response.body).to include('<a class="btn btn-primary" href="/logout"  role="button">Log out</a>')
      expect(@response.body).to include('<a class="btn btn-primary" href="/peep"  role="button"><b>Peep</b></a>')
    end
  end

  context 'Log in page - GET /login' do
    before do
      @response = get('/login')
    end
    
    xit 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    xit 'has an email/username input field' do
      expect(@response.body).to include('<input class="form-control" id="login_email/username" placeholder="Enter email or username">')
    end

    xit 'has a password field' do
      expect(@response.body).to include('<input type="password" class="form-control" id="login_password" placeholder="Password">')
    end

    xit 'has a login button' do
      expect(@response.body).to include('<a class="btn btn-primary" href="/"  role="button">Log in</a>')
    end

    xit 'has a link to sign up' do
      expect(@response.body).to include('<a href="/signup">Sign up</a>')
    end
  end

  context 'Sign up page - GET /signup' do
    before do
      @response = get('/login')
    end
    
    xit 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    xit 'has an input field for email' do
      expect(@response.body).to include('<input type="email" class="form-control" id="signup_email" aria-describedby="emailHelp" placeholder="Email address">')
    end

    xit 'has an input field for password' do
      expect(@response.body).to include('<input type="password" class="form-control" id="signup_password" placeholder="Password">')
    end

    xit 'has an input field for name' do
      expect(@response.body).to include('<input class="form-control" id="signup_name" placeholder="Full name">')
    end

    xit 'has an input field for username' do
      expect(@response.body).to include('<input class="form-control" id="signup_username" placeholder="Username">')
    end

    xit 'has a sign up submit button' do
      expect(@response.body).to include('<button class="btn btn-primary" href="/" type="submit">Sign up</button>')
    end
  end

  context 'Make a peep page - GET /peep' do
    before do
      @response = get('/peep')
    end
    
    xit 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    xit 'has an input field for the peep' do
      expect(@response.body).to include('<textarea class="form-control" rows="3" id="peep" placeholder="Make a peep!"></textarea>')
    end

    xit 'has a peep submit button' do
      expect(@response.body).to include('<button class="btn btn-primary" type="submit">Peep</button>')
    end
  end

  context 'Peep info page - GET /peep/:id' do
    before do
      @response = get('/peep/1')
    end
    
    xit 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    xit 'has the date of the peep' do
      expect(@response.body).to include('<p>Date: 2023-03-11</p>')
    end

    xit 'has the time of the peep' do
      expect(@response.body).to include('<p>Time: 21:07:32</p>')
    end

    xit 'peeps have the name and username of the maker' do
      expect(@response.body).to include('<p>Samuel Badru | <em>@sobad</em></p>')
    end
  end

  context 'POST /peep' do
    before do
      @response = post('/peep', content: "My second peep", user_id: '1')
    end
    
    xit 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    xit 'shows the new peep on the homepage' do
      expect(@response.body).to include ('<a href="/peep/7">My second peep</a>')
    end
  end

  context 'POST /login' do
    before do
      @response = post('/login', email: "samuelbadru@outlook.com", password: 'makersforlife')
    end
    
    xit 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    xit 'shows the logged in version of the homepage' do
      expect(@response.body).to include('<a class="btn btn-primary" href="/logout"  role="button">Log out</a>')
      expect(@response.body).to include('<a class="btn btn-primary" href="/peep"  role="button"><b>Peep</b></a>')
    end
  end

  context 'POST /signup' do
    before do
      @response = post('/signup', email: "santandave@icloud.com", password: 'psychodrama', name: 'Santan Dave', username: 'dave')
    end
    
    xit 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    xit 'shows the user when they peep' do
      peep = post('/peep', content: "At this age how are them man still hating", user_id: '5')
      expect(@response.body).to include ('<a href="/peep/7">At this age how are them man still hating</a>')
    end
  end

  # No parameters may be needed, just need to empty whatever is logged in and redirect
  context 'POST /logout' do
    before do
      @response = post('/logout')
    end
    
    xit 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    # may not need to specify homepage as that is going to be the response
    xit 'shows the user when they peep' do
      expect(@response.body).to include('<a class="btn btn-primary"  href="/login" role="button">Log in</a>')
      expect(@response.body).to include('<a class="btn btn-primary" href="/signup"  role="button">Sign up</a>')
    end
  end
end