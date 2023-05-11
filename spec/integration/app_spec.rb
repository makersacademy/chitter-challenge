require "spec_helper"
require "rack/test"
require_relative "../../app"

RSpec.describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /" do
    it 'displays an html view of the homepage with links to sign up or log in' do
      response = get("/")

      expect(response.status).to eq 200

      expect(response.body).to include "<a href=\"/signup\"> Sign up </a>"
      expect(response.body).to include "<a href=\"/login\"> Log in </a>"
    end

    it 'lists the current peeps in the database in reverse chronological order' do
      response = get("/")

      expect(response.status).to eq 200

      latest_peep = "<p> I love pizza. - peeped at: 2023-05-10 13:00:00 +0100 </p>"
      earliest_peep = "<p> Hello world - peeped at: 2023-05-10 09:00:00 +0100 </p>"
      expect(response.body).to include latest_peep
      expect(response.body).to include earliest_peep

      earliest_peep_index = response.body.index(earliest_peep)
      latest_peep_index = response.body.index(latest_peep)
      # Check that the latest peep appears before the earliest peep
      expect(earliest_peep_index).to be > latest_peep_index
    end

    it 'displays a new peep first' do
      Peep.create(text: "I'm new here", created_at: Time.parse("2023-05-11 09:00:00"))
      response = get("/")

      new_peep = "<p> I'm new here - peeped at: 2023-05-11 09:00:00 +0100 </p>"
      second_newest_peep = "<p> I love pizza. - peeped at: 2023-05-10 13:00:00 +0100 </p>"

      expect(response.body).to include "<p> I'm new here - peeped at: 2023-05-11 09:00:00 +0100 </p>"

      new_peep_index = response.body.index(new_peep)
      second_newest_peep_index = response.body.index(second_newest_peep)

      expect(new_peep_index).to be < second_newest_peep_index

    end

    it "says 'No one's made a peep!' when there are no peeps in the database" do
      Peep.destroy_all
      response = get("/")

      expect(response.status).to eq 200

      expect(response.body).to include "<p> 'No one's made a peep!' </p>"
    end
  end

  context 'GET /signup' do
    it 'displays an html view with a form to create a new user' do
      response = get('/signup')

      expect(response.status).to eq 200

      expect(response.body).to include '<h1> Sign up </h1>'

      expect(response.body).to include '<form method="POST" action="/new-user">'

      expect(response.body).to include '<input type="text" name="name">'
      expect(response.body).to include '<input type="text" name="email_address">'
      expect(response.body).to include '<input type="text" name="password">'
    end
  end

  context 'POST /new-user' do
    it 'creates an new user in the database with an encrypted password and returns an html confirmation' do
      response = post(
        '/new-user',
        name: 'Jeff',
        email_address: 'Jeff@gmail.com',
        password: '12345678'
      )
      input_password = '12345678'
      expect(response.status).to eq 200

      expect(response.body).to include '<h1> Welcome to Chitter, Jeff! </h1>'

      latest_user = User.last
      password_hash = latest_user.password_hash

      expect(latest_user.name).to eq 'Jeff'
      expect(latest_user.email_address).to eq 'Jeff@gmail.com'

      expect(password_hash).not_to be nil
      expect(password_hash).not_to eq input_password 
    end

    it 'links to a log in page' do
        response = post(
        '/new-user',
        name: 'Jeff',
        email_address: 'Jeff@gmail.com',
        password: '12345678'
      )
      
      expect(response.body).to include "<a href=\"/login\"> Click here to log in </a>"
    end

    it 'redirects to GET /signup if an input is invalid' do
        response = post(
        '/new-user',
        name: 'Jeff',
        email_address: '',
        password: '12345678'
      )
      expect(response).to be_redirect
      expect(response.location).to eq "http://example.org/signup"
  
    end
  end

  context 'GET /login' do
    it 'returns a form html view with a form to log in' do
      response = get("/login")

      expect(response.status).to eq 200     
      
      expect(response.body).to include '<form method="POST" action="/login">'

      expect(response.body).to include '<input type="text" name="email_address">'
      expect(response.body).to include '<input type="text" name="password">'
    end
  end

  context 'POST /login' do
    it 'logs in an existing user, saves their data in a session and returns html confirmation' do
      response = post(
        "/login",
        email_address: "User1@gmail.com",
        password: "password1"
      )
      expect(response.status).to eq 200     
   
      expect(response.body).to include "<h1> Welcome back to Chitter, User 1! </h1>"
      expect(session['name']).to eq "User 1"
      expect(session['email_address']).to eq "User1@gmail.com"
    end
    
    it 'logs in a newly created user, saves their data in a session and returns confirmation' do
      User.create(name: 'Jeff', email_address: "Jeff@gmail.com", password: "my_password")
      
      response = post(
        "/login",
        email_address: "Jeff@gmail.com",
        password: "my_password"
      )

      expect(response.status).to eq 200     
   
      expect(response.body).to include "<h1> Welcome back to Chitter, Jeff! </h1>"
      expect(session['name']).to eq "Jeff"
      expect(session['email_address']).to eq "Jeff@gmail.com"
    end

    it 'has a link on confirmation page to a personal user page' do
      response = post(
        "/login",
        email_address: "User1@gmail.com",
        password: "password1"
      )
      expect(response.status).to eq 200           

      expect(response.body).to include "<a href=\"/User-1/page\"> Click here to access your user page </a>"   
    end

    it 'redirects to GET /login if email does not exist in database' do
      response = post(
        "/login",
        email_address: "fake_email@gmail.com",
        password: "fake_password"
      )

      expect(response).to be_redirect    
      expect(response.location).to eq("http://example.org/login")
    end

    it 'redirects to GET /login if email is correct but password is not' do
      response = post(
        "/login",
        email_address: "User1@gmail.com",
        password: "wrong_password"
      )

      expect(response).to be_redirect    
      expect(response.location).to eq("http://example.org/login")
    end

  end

  context 'GET /logout' do
    it 'sets the session parameters to nil and redirects to home page' do
      fake_session = { 'rack.session' => { name: 'fake_user', email_address: 'fake_email' } }
      response = get("/logout", {}, fake_session)

      expect(response).to be_redirect    
      expect(response.location).to eq("http://example.org/")
        
      expect(session["name"]).to be nil
      expect(session["email_address"]).to be nil
    end
  end

  context 'GET /:user/page' do

    it 'redirects to login page if no session is active' do
      response = get('/:user/page')

      expect(response).to be_redirect    
      expect(response.location).to eq("http://example.org/login")

    end

    it 'displays an html view with a link to create a peep' do
      session = { 'rack.session' => { name: 'fake_user' } }
      response = get('/:user/page', {}, session)

      expect(response.status).to eq 200

      expect(response.body).to include ("<a href=\"/user/compose_peep\"> Compose Peep </a>")

    end

    it 'has a link to log out' do
      session = { 'rack.session' => { name: 'fake_user' } }
      response = get('/:user/page', {}, session)

      expect(response.status).to eq 200

      expect(response.body).to include ("<a href=\"/logout\"> Log Out </a>")

    end

    it 'lists the current peeps in the database in reverse chronological order' do
      session = { 'rack.session' => { name: 'fake_user' } }
      response = get('/:user/page', {}, session)

      expect(response.status).to eq 200

      latest_peep = "<p> I love pizza. - peeped at: 2023-05-10 13:00:00 +0100 </p>"
      earliest_peep = "<p> Hello world - peeped at: 2023-05-10 09:00:00 +0100 </p>"
      expect(response.body).to include latest_peep
      expect(response.body).to include earliest_peep

      earliest_peep_index = response.body.index(earliest_peep)
      latest_peep_index = response.body.index(latest_peep)
      # Check that the latest peep appears before the earliest peep
      expect(earliest_peep_index).to be > latest_peep_index  
    end

    it 'displays a new peep first' do
      Peep.create(text: "I'm new here", created_at: Time.parse("2023-05-11 09:00:00"))

      session = { 'rack.session' => { name: 'fake_user' } }
      response = get('/:user/page', {}, session)

      new_peep = "<p> I'm new here - peeped at: 2023-05-11 09:00:00 +0100 </p>"
      second_newest_peep = "<p> I love pizza. - peeped at: 2023-05-10 13:00:00 +0100 </p>"

      expect(response.body).to include "<p> I'm new here - peeped at: 2023-05-11 09:00:00 +0100 </p>"

      new_peep_index = response.body.index(new_peep)
      second_newest_peep_index = response.body.index(second_newest_peep)

      expect(new_peep_index).to be < second_newest_peep_index

    end

    it "says 'No one's made a peep!' when there are no peeps in the database" do
      Peep.destroy_all
      session = { 'rack.session' => { name: 'fake_user' } }
      response = get('/:user/page', {}, session)

      expect(response.status).to eq 200

      expect(response.body).to include "<p> 'No one's made a peep!' </p>"
    end
  end

  context 'GET /:user/compose_peep' do

    it 'redirects to login page if no session is active' do
      response = get('/:user/compose_peep')

      expect(response).to be_redirect    
      expect(response.location).to eq("http://example.org/login")

    end

    it 'displays an html view with a form to create a peep' do
      session = { 'rack.session' => { name: 'fake_user' } }
      response = get('/:user/compose_peep', {}, session)

      expect(response.status).to eq 200
      
      expect(response.body).to include '<h1> Compose Peep </h1>'
      
      expect(response.body).to include '<form method="POST" action="/user/new-peep">'
      expect(response.body).to include '<input type="text" name="text">'
    end

    it 'has an optional field for a tag' do
      session = { 'rack.session' => { name: 'fake_user' } }
      response = get('/:user/compose_peep', {}, session)

      expect(response.status).to eq 200
            
      expect(response.body).to include '<label> Optional Tag </label>'
      expect(response.body).to include '<input type="text" name="tag">'
    end      
  end

  context 'POST /user/new-peep' do
    context 'new peep with no optional tag' do
      it 'creates a new peep in the database and returns an html view with confirmation' do  
      session = { 'rack.session' => { name: 'User 1' } }

      response = post(
      '/user/new-peep',
      { :text => "It's peepin off" }, 
      session
      ) 

      expect(response.status).to eq 200    

      expect(response.body).to include "<h1> You've made a peep! </h1>"

      latest_peep = Peep.last

      expect(latest_peep.text).to eq "It's peepin off"
      expect(latest_peep.user_id).to eq 1
      expect(latest_peep.tags.size).to eq 0

      end
    end

    context 'new peep with existing optional tag' do
      it 'associates an existing tag with new peep in the database' do
        session = { 'rack.session' => { name: 'User 1' } }

        response = post(
        '/user/new-peep',
        { :text => "Hello", :tag => 'greetings' }, 
        session
        ) 

        expect(response.status).to eq 200    

        latest_peep = Peep.last
        existing_tag = latest_peep.tags.first
        expect(latest_peep.tags.size).to eq 1
        expect(existing_tag.content).to eq "greetings"
      end  

      xit 'if the optional tag is the name of an existing user, it emails that user' do
      
      end
    end

    context 'new peep with a new optional tag' do
      it 'creates a new tag in the database and associates it with the new peep' do
        session = { 'rack.session' => { name: 'User 1' } }

        response = post(
        '/user/new-peep',
        { :text => "Hello", :tag => 'new tag' }, 
        session
        ) 

        expect(response.status).to eq 200    

        latest_peep = Peep.last
        existing_tag = latest_peep.tags.first
        expect(latest_peep.tags.size).to eq 1
        expect(existing_tag.content).to eq "new tag"        
      end
    end

    it 'links back to the user page' do
      session = { 'rack.session' => { name: 'User 1' } }

      response = post(
      '/user/new-peep',
      { :text => "It's peepin off" }, 
      session
      ) 

      expect(response.status).to eq 200    

      expect(response.body).to include "<a href=\"/:user/page\"> Return to your page </a>"
      
    end

  end

end
