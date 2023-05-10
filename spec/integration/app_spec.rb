require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do

  include Rack::Test::Methods
  let(:app) { Application.new }

  context '/' do
    it 'Should return a html formatted web page including a welcome banner' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include ('<h1>Welcome to the Chitter-Sphere!</h1>')
    end

    it 'Should include a photograph/graphic' do
      response = get('/')
      expect(response.body).to include ('<img src=></img>')
    end

    it 'Should include 5 different hyperlinks' do
      response = get('/')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<a href="/peeps">View all peeps</a>')
      expect(response.body).to include ('<a href="/peep/new">Post a new peep</a>')
      expect(response.body).to include ('<a href="/loginpage">Log in</a>')
      expect(response.body).to include ('<a href="/signup">Sign up</a>')
      expect(response.body).to include('<a href="/userpage">My account</a>')
    end
  end

  context '/peeps' do
    it 'Should display all peeps from all makers within the peeps database formatted in HTML' do
      response = get('/peeps')
      expect(response.status).to eq (200)
      expect(response.body).to include ('HayleyOk')
      expect(response.body).to include ('Another test peep')
      expect(response.body).to include ('2023-07-21 12:25:12')
    end
  end

  context '/loginpage' do
    it 'Should return a login submit form' do
      response = get('/loginpage')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<form method="POST" action="/loginpage">')
      expect(response.body).to include ('<input type="text" name="username"/>')
      expect(response.body).to include ('<input type="text" name="password"/>')
      expect(response.body).to include ('<input type="submit"/>')
    end

    it 'Should return an error page when username is not present within the DB' do
      response = post('/loginpage', username: 'FakeUsername', password: 'Password1!')
      expect(response.status).to eq(500)
    end

    it 'Should return an alternate/error page when password is incorrect' do
      response = post('/loginpage', username: 'MattyMooMilk', password: 'Password')
      expect(response.status).to eq(200)
      expect(response.body).to include ('Login unsuccessful')
      expect(response.body).to include ('<p>Please return to the login page and try again</p>')
      expect(response.body).to include ('<a href="/loginpage">Login page</a>')
    end

    it 'Should return a welcome banner with the correct users name' do
      response = post('/loginpage', username: 'MattyMooMilk', password: 'Password1!')
      expect(response.status).to eq(200)
      expect(response.body).to include ('Matty Boi')
    end

    it 'Should return a welcome banner with the correct users name' do
      response = post('/loginpage', username: 'HayleyOk', password: 'DifferentPassword123.')
      expect(response.status).to eq(200)
      expect(response.body).to include ('Hayley Lady')
    end

    it 'Should return a list of user options as hyperlinks' do
      response = post('/loginpage', username: 'MattyMooMilk', password: 'Password1!')
      expect(response.status).to eq(200)
      expect(response.body).to include ('<a href="/peep/new">Post a new peep</a>')
      expect(response.body).to include ('<a href="/peep/delete">Delete a peep</a>')
      expect(response.body).to include ('<a href="/peeps/:id">View your previous peeps</a>')
      expect(response.body).to include ('<a href="/logout">Log out</a>')
    end
  end

  context '/signup' do
    it 'Should return a sign up form to add a new maker to the database' do
      response = get('/signup')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<form method="POST" action="/signup">')
      expect(response.body).to include ('<h1>Create an account</h1>')
      expect(response.body).to include ('<input type="text" name="name"/>')
      expect(response.body).to include ('<label>Username:</label>')
      expect(response.body).to include ('<input type="text" name="username"/>')
    end
  
    it 'Should add a new maker to the database/create a maker account and then redirect to user page' do
      response = post('/signup', name: 'Matt', username: 'mattmatttest', email_address: 'bigmatt44@gmail.com', password: 'ValidPassword12')
      expect(response.status).to eq (302)
    end

    it 'Should return an error when username already exists in database' do
      response = post('/signup', name: 'Hayley A', username: 'HayleyOk', email_address: 'hayleyhayley@tiscali.net', password: 'AnotherPass1')
      expect(response.status).to eq (400)
    end

    it 'Should return an error when the email address already exists in the database' do
      response = post('/signup', name: 'Hayley A', username: 'HayleyAlt', email_address: 'another_fake_email420@gmail.com', password: 'AnotherPass1')
      expect(response.status).to eq (400)
    end

    it 'Should return an error when a nil value is entered' do
      response = post('/signup', name: 'Matt H', username: 'MattAlt', email_address: nil, password: 'AnotherPass1')
      expect(response.status).to eq (400)
    end

    it 'Should return an error when an input is empty' do
      response = post('/signup', name: 'Matt H', username: '', email_address: 'fakestofthemall@testmail.com', password: 'AnotherPass1')
      expect(response.status).to eq (400)
    end
  end

  context 'peep/new' do
    it 'Should return an error page with hyperlinks to log in if user is not logged in already' do
      response = get('/peep/new')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<p>To post a new peep please login or create an account</p>')
      expect(response.body).to include ('<a href="/signup">Sign up page</a>')
      expect(response.body).to include ('<a href="/loginpage">Login page</a>')
    end

    # it 'Should return a form page to create a new peep if the user is logged in' do
    #   response = get('/peep/new')
    #   session[:key]
    #   expect(response.status).to eq (200)
    #   expect(response.body).to include ('<h1>Post a new peep to Chitter</h1>')
    #   expect(response.body).to include ('<form method="POST" action="/peep/new">')
    #   expect(response.body).to include ('<input type="text" name="content"/>')
    #   expect(response.body).to include ('<input type="submit"/>')
    # end

    it 'Should only allow users logged into their account to successfully create new peeps' do
      response = post('/peep/new', title: 'new title', content: 'This is some content yes')
      expect(response.status).to eq (200)
      expect(response.body).to include ('<h1>Your Peep was successfully posted!</h1>')
      expect(response.body).to include ('<a href="/userpage">Your account</a>')
      expect(response.body).to include ('<a href="/">Homepage</a>')
    end
  end

  # context '/peeps/:id' do
  #   it 'Should return all peeps by passed maker in a formatted HTML list' do
  #     response = post('/peeps/1')
  #     expect(response.status).to eq (200)
  #     expect(response.body).to include ('')
  #     expect(response.body).to include ('')
  #     expect(response.body).to include ('')
  #   end
  # end

end
