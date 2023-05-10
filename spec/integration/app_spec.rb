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
    it 'creates an new user in the database and returns an html view with confirmation' do
      response = post(
        '/new-user',
        name: 'Jeff',
        email_address: 'Jeff@gmail.com',
        password: '12345678'
      )

      expect(response.status).to eq 200

      expect(response.body).to include '<h1> Welcome to Chitter, Jeff! </h1>'

      latest_user = User.last

      expect(latest_user.name).to eq 'Jeff'
      expect(latest_user.email_address).to eq 'Jeff@gmail.com'
      expect(latest_user.password).to eq '12345678'
    end

    # need to test validations and failed sign up

    it 'links to a log in page' do
      response = post('/new-user' )

      expect(response.body).to include "<a href=\"/login\"> Click here to log in </a>"
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

    it 'redirects to GET /login if log in details are incorrect' do
      response = post(
        "/login",
        email_address: "fake_email@gmail.com",
        password: "fake_password"
      )

      expect(response).to be_redirect    
      expect(response.location).to eq("http://example.org/login")
    end
  end

  # will implement username in path when I implement sessions

  context 'GET /user/page' do
    it 'displays an html view with a link to create a peep' do
      response = get('/user/page')

      expect(response.status).to eq 200

      expect(response.body).to include ("<a href=\"/user/compose_peep\"> Compose Peep </a>")

    end

    # will need to update above with link to logout

    it 'lists the current peeps in the database in reverse chronological order' do
      response = get('/user/page')

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
      response = get('/user/page')

      new_peep = "<p> I'm new here - peeped at: 2023-05-11 09:00:00 +0100 </p>"
      second_newest_peep = "<p> I love pizza. - peeped at: 2023-05-10 13:00:00 +0100 </p>"

      expect(response.body).to include "<p> I'm new here - peeped at: 2023-05-11 09:00:00 +0100 </p>"

      new_peep_index = response.body.index(new_peep)
      second_newest_peep_index = response.body.index(second_newest_peep)

      expect(new_peep_index).to be < second_newest_peep_index

    end

    it "says 'No one's made a peep!' when there are no peeps in the database" do
      Peep.destroy_all
      response = get('/user/page')

      expect(response.status).to eq 200

      expect(response.body).to include "<p> 'No one's made a peep!' </p>"
    end
  end

  context 'GET /user/compose_peep' do
    it 'displays an html view with a form to create a peep' do
    response = get('/user/compose_peep') 

    expect(response.status).to eq 200
    
    expect(response.body).to include '<h1> Compose Peep </h1>'
    
    expect(response.body).to include '<form method="POST" action="/user/new-peep">'
    expect(response.body).to include '<input type="text" name="text">'
    end
  end

  context 'POST /user/new-peep' do
    xit 'creates a new peep in the database and returns an html view with confirmation' do  
      response = post(
      '/user/new_peep',
      text: "It's peepin off"
      ) 

      expect(response.status).to eq 200    

      expect(response.body).to include "<h1> You've made a peep! </h1>"

      latest_peep = Peep.last

      expect(latest_peep.text).to eq "It's peepin off"
      expect(latest_peep.user).to eq ??

      # test for correct user
    end

    # will need to test for link to return, and need to test for adding tags to posts
  end

end
