require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_peeps_users_tables
  seed_sql = File.read('spec/peeps_users_tables.sql')
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
     
    xit 'is a valid web query' do
      expect(@response.status).to eq (200)
    end

    xit 'has "Chitter" as the title' do
      expect(@response.body).to include('<h1>Chitter</h1>')
    end

    xit 'has a list of peeps' do
      expect(@response.body).to include('<a href="/peep/1">Just set up my chitter</a>')
      expect(@response.body).to include('<a href="/peep/2">RIP Uncle Phil</a>')
    end

    xit 'peeps have the name and username of the maker' do
      expect(@response.body).to include('<p>Samuel Badru | <em>@sobad</em></p>')
      expect(@response.body).to include('<p>Jermaine Cole | <em>@j.cole</em></p>')
    end

    xit 'has sign up and log in buttons when not logged in' do
      expect(@response.body).to include('<a class="btn btn-primary"  href="/login" role="button">Log in</a>')
      expect(@response.body).to include('<a class="btn btn-primary" href="/signup"  role="button">Sign up</a>')
    end

    xit 'has peep and log out buttons when logged in' do
      repo = UserRepository.new
      login = repo.find_user('aubreygraham@gmail.com', 'hotlinebling')

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
      expect(@response.body).to include('<input class="form-control" id="login_email/username" placeholder="Enter email or username"')
    end

    xit 'has a password field' do
      expect(@response.body).to include('<input type="password" class="form-control" id="login_password" placeholder="Password"')
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
      expect(@response.body).to include('<input type="email" class="form-control" id="signup_email" aria-describedby="emailHelp" placeholder="Email address"')
    end

    xit 'has an input field for password' do
      expect(@response.body).to include('<input type="password" class="form-control" id="signup_password" placeholder="Password"')
    end

    xit 'has an input field for name' do
      expect(@response.body).to include('<input class="form-control" id="signup_name" placeholder="Full name"')
    end

    xit 'has an input field for username' do
      expect(@response.body).to include('<input class="form-control" id="signup_username" placeholder="Username"')
    end
  end

  # Page: make a new peep

  ## Request:
  GET /peep
  No parameters

  ## Response (200 OK)
  HTML view with form to submit new peep (to POST /peeps)
  ```

  ```md




  # Page: see full details of peep

  ## Request:
  GET /peep/:id
  With path parameter :id

  ## Response (200 OK)
  HTML view with details of a single peep
  ```

  ```md




  # Page: new peep sent

  ## Request:
  POST /peep
  With body parameters:
    content="My first peep" # only parameter user should have to manually input
    name = "Samuel Badru"
    username ="sobad" #pre-fill name and username with stored logged in details
    when = #automatically give current date & time?

  ## Response (200 OK)
  Sends back to homepage - user should see their peep top of the list




  # Page: log in

  ## Request:
  POST /login
  With body parameters:
    email="samuelbadru@outlook.com"
    password = "securepassword23"


  ## Response (200 OK)
  Sends back to logged in version of homepage - user should see buttons such as 'Create a peep' and 'Sign out'




  # Page: sign up

  ## Request:
  POST /signup
  With body parameters:
    email="samuelbadru@outlook.com"
    name="Samuel Badru"
    username="sobad"
    password = "securepassword23"


  ## Response (200 OK)
  Sends back to logged in version of homepage - user should see buttons such as 'Create a peep' and 'Sign out'





  # Page: log out button on homepage

  ## Request:
  POST /logout
  With body parameters:
    email="samuelbadru@outlook.com"
    password = "securepassword23"


  ## Response (200 OK)
  Sends back to logged out version of homepage - user should see buttons such as 'Log in' and 'Sign up'





end