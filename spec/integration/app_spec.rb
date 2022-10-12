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

  let(:app) { Application.new }

  context "GET to '/'" do
    it "returns 200 and all the peeps with the name and username of their creators" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>chitter</h1>")
      expect(response.body).to include("<h2>makers chit chat</h2>")
      expect(response.body).to include("<a href='/signup' class=button >chit up</a>")
      expect(response.body).to include("<a href='/login' class=button>chit in</a>")
      expect(response.body).to include("<p class=name>Anna</p>")
      expect(response.body).to include("<p class=username>@anna123</p>")
      expect(response.body).to include("<p class=content>I love sunshine</p>")
      expect(response.body).to include("<p class=time>10:23 AM 19 Oct 04</p>")
      expect(response.body).to include("<p class=name>John</p>")
      expect(response.body).to include("<p class=username>@john123</p>")
      expect(response.body).to include("<p class=content>I like cats</p>")
      expect(response.body).to include("<p class=time>10:00 AM 19 Oct 09</p>")
    end
  end

  context "GET to /signup" do
    it "returns the HTML form to create a new user" do
      response = get('/signup')
      expect(response.status).to eq(200)
      expect(response.body).to include("<form class=form method='POST' action='/new_user'>")
      expect(response.body).to include("<input type='text' name='name' placeholder='John'/>")
      expect(response.body).to include("<input type='text' name='username' placeholder='name123'/>")
      expect(response.body).to include(" <input type='email' name='email' placeholder='myemail@makersacademy.com'/>")
      expect(response.body).to include("<input type='password' name='password' placeholder='MyPassword123$'/>")
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
      expect(response.body).to include('<h5>Welcome to chitter, Joanna!</h5>')
      expect(response.body).to include("<a href='/login' class=button-new-user>log in to share your thoughts</a>")
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
      expect(response.body).to include('<p>This email has already been registered.</p>')
      expect(response.body).to include("<p>Please review your details:</p>")
      expect(response.body).to include("<form class=form method='POST' action='/new_user'>")
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
      expect(response.body).to include('<p>This username is already in use. Please choose a different one.</p>')
      expect(response.body).to include("<p>Please review your details:</p>")
      expect(response.body).to include("<form class=form method='POST' action='/new_user'>")
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

    it 'fails to create a new user if the username is invalid' do
      response = post(
        '/new_user', 
        name: 'Joanna', 
        username: 'jo&ann* a123', 
        email: 'joannaMccain@makersacademy.com',
        password: 'er4gg@$34tfsd'
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include('<p>Your username must contain letters and numbers and be 5 to 16 characters long</p>')
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

  context "GET to /login" do
    it "returns the HTML form to create a new user" do
      response = get('/login')
      expect(response.status).to eq(200)
      expect(response.body).to include("<form class=form method='POST' action='/login'>")
      expect(response.body).to include("<input type='email' name='email' placeholder='myemail@makersacademy.com'/>  ")
      expect(response.body).to include("<input type='password' name='password' placeholder='MyPassword123$'/>  ")
    end
  end

  context "POST /login" do
    it "returns the error page when email is incorrect" do
      response = post('/login', 
        email: 'avdvna@makersacademy.com',
        password: '235346hgsdv'
      )
      expect(response.status).to eq(200)
      expect(response.body).to include("<form class=form method='POST' action='/login'>")
      expect(response.body).to include("<p>The information you provided does not match our records.</p>")
      expect(response.body).to include("<input type='email' name='email' placeholder='myemail@makersacademy.com'/>")
      expect(response.body).to include("<input type='password' name='password' placeholder='MyPassword123$'/>")
    end

    it "returns the error page when password is incorrect" do
      response = post('/login', 
        email: 'anna@makersacademy.com',
        password: 'incorrect5'
      )
      expect(response.status).to eq(200)
      expect(response.body).to include("<form class=form method='POST' action='/login'>")
      expect(response.body).to include("<p>The information you provided does not match our records.</p>")
      expect(response.body).to include("<input type='email' name='email' placeholder='myemail@makersacademy.com'/>")
      expect(response.body).to include("<input type='password' name='password' placeholder='MyPassword123$'/>")
    end

    it "returns the error page when details are empty" do
      response = post('/login', 
        email: '',
        password: ''
      )
      expect(response.status).to eq(200)
      expect(response.body).to include("<form class=form method='POST' action='/login'>")
      expect(response.body).to include("<p>The information you provided does not match our records.</p>")
      expect(response.body).to include("<input type='email' name='email' placeholder='myemail@makersacademy.com'/>")
      expect(response.body).to include("<input type='password' name='password' placeholder='MyPassword123$'/>")
    end

    it "logs in user when email and password are correct and displays the list of peeps" do
      env 'rack.session', user_id: '1'
      response = post('/login', 
        email: 'anna@makersacademy.com',
        password: '235346hgsdv'
      )
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>chitter</h1>")
      expect(response.body).to include("<h2>makers chit chat</h2>")
      expect(response.body).to include("<h4>Hi Anna!</h4>")
      expect(response.body).to include("p class=welcome>What are you up to today?</p>")
      expect(response.body).to include("<form method='POST' action='/new_peep'>")
      expect(response.body).to include("<input type='text' name='content'/>")
      expect(response.body).to include("<p class=name>Anna</p>")
      expect(response.body).to include("<p class=username>@anna123</p>")
      expect(response.body).to include("<p class=content>I love sunshine</p>")
      expect(response.body).to include("<p class=time>10:23 AM 19 Oct 04</p>")
      expect(response.body).to include("<p class=name>John</p>")
      expect(response.body).to include("<p class=username>@john123</p>")
      expect(response.body).to include("<p class=content>I like cats</p>")
      expect(response.body).to include("<p class=time>10:00 AM 19 Oct 09</p>")
      expect(response.body).to include("<a href='/logout' class=index-button>chit out</a>")
    end
  end
  
  context "POST /new_peep" do
    it 'creates a new peep and returns 200 OK' do
      allow(Time).to receive(:new).and_return Time.new(2022, 9, 19, 7, 23, 7)
      env 'rack.session', user_id: '1'
      response = post(
        '/new_peep', 
        content: 'I am happy', 
      )
      peeps = PeepRepository.new.all
      expect(response.status).to eq(200)
      expect(peeps).to include(
        have_attributes(content: 'I am happy')
      )
      expect(response.body).to include("<h1>chitter</h1>")
      expect(response.body).to include("<h2>makers chit chat</h2>")
      expect(response.body).to include("<h4>Hi Anna!</h4>")
      expect(response.body).to include("p class=welcome>What are you up to today?</p>")
      expect(response.body).to include("<p class=name>Anna</p>")
      expect(response.body).to include("<p class=username>@anna123</p>")
      expect(response.body).to include("<p class=content>I am happy</p>")
      expect(response.body).to include("<p class=time> 7:23 AM 19 Sep 22</p>")
      expect(response.body).to include("<form method='POST' action='/new_peep'>")
      expect(response.body).to include("<input type='text' name='content'/>")
      expect(response.body).to include("<p class=content>I love sunshine</p>")
      expect(response.body).to include("<p class=time>10:23 AM 19 Oct 04</p>")
      expect(response.body).to include("<p class=name>John</p>")
      expect(response.body).to include("<p class=username>@john123</p>")
      expect(response.body).to include("<p class=content>I like cats</p>")
      expect(response.body).to include("<p class=time>10:00 AM 19 Oct 09</p>")
      expect(response.body).to include("<a href='/logout' class=index-button>chit out</a>")
    end

    it 'fails to create a new peep when the content is empty' do
      env 'rack.session', user_id: '1'
      response = post(
        '/new_peep', 
        content: "", 
        time: '2004-10-19 12:23:54',
      )
      peeps = PeepRepository.new.all
      expect(response.status).to eq(200)
      expect(response.body).to include("<h4>Hi Anna!</h4>")
      expect(response.body).to include("p class=welcome>What are you up to today?</p>")
      expect(response.body).to include("<p>Please enter your message.</p>")
      expect(response.body).to include("<p>It must be shorter than 33 characters and contain letters and digits only:</p>")
      expect(response.body).to include("<form method='POST' action='/new_peep'>")
      expect(response.body).to include("<input type='text' name='content'/>")
    end

    it 'redirects when not logged in and returns 302' do
      response = post(
        '/new_peep', 
        content: 'I am happy', 
        time: '2004-10-19 12:23:54',
      )
      peeps = PeepRepository.new.all
      expect(response.status).to eq(302)
      expect(peeps).not_to include(
        have_attributes(content: 'I am happy')
      )
    end
  end

  context 'when logging out' do
    it 'logs out the user and displays the index page' do
      response = get('/logout')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>chitter</h1>")
      expect(response.body).to include("<h2>makers chit chat</h2>")
      expect(response.body).to include("<h5>You have been successfully logged out!</h5>")
      expect(response.body).to include("<a href='/login' class=button-new-user>log in to share your thoughts</a>")
      expect(response.body).to include("<a href= '/' class=index-button>keep on reading us without posting</a>")
    end
  end
end
