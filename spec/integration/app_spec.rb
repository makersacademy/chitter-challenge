require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context "GET /" do
    it "should return a list of all peeps" do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include(' <strong>user1</strong> (username1)</br>')
    end
  end

  context "GET /register" do
    it "should take the user to a sign up page" do
      response = get('/register')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/register" method="POST">')
      expect(response.body).to include('<input type="text" name="new_name">')
      expect(response.body).to include('<input type="text" name="new_username">')
    end
  end
  context "POST /register" do
    it "should return a success page" do
      response = post('/register',
      new_name: "Checking Name",
      new_username: "Checkingusername",
      new_email: "checkingemail@fakeemail.com",
      new_password: "CheckingPassword1")

      expect(response.status).to eq(200)
      expect(response.body).to include('<p>Thank you for signing up to Chitter!</p>')

      repo = UserRepository.new
      new_user = repo.all.last
      expect(repo.all.length).to eq(4)
      expect(new_user.name).to eq('Checking Name')
    end
    it "responds with 200 status if email is a duplicate" do
      response = post('/register',
                new_name: "Abbi Smith",
                new_username: "AbiS99",
                new_email: "user1@fakeemail.com",
                new_password: "Password1")
      
      expect(response.status).to eq(200)
      expect(response.body).to include("<h4> * The email address entered is already in use </h4>")

    end
    it "responds with 200 status if username is a duplicate" do
      response = post('/register',
                new_name: "Lulu Mott",
                new_username: "username1",
                new_email: "user22@fakeemail.com",
                new_password: "Password1")
      
      expect(response.status).to eq(200)
      expect(response.body).to include("<h4> * The username entered is already in use </h4>")
    end
    it "responds with 200 status if password is weak" do
      response = post('/register',
                new_name: "user22",
                new_username: "username22",
                new_email: "user22@fakeemail.com",
                new_password: "pas")
      
      expect(response.status).to eq(200)
      expect(response.body).to include("<h4> * Your password must be at least 8 characters long with at least one number </h4>")
    end
    it "responds with 200 status if username has incorrect characters" do
      response = post('/register',
                new_name: "user22*>-",
                new_username: "username22",
                new_email: "user22@fakeemail.com",
                new_password: "Password1")
      
      expect(response.status).to eq(200)
      expect(response.body).to include("<h4> Please ensure that: </h4>")
      expect(response.body).to include("<h4> * Your name or username does not contain any numbers or special characters </h4>")
    end
    it "responds with 200 status if name has incorrect characters" do
      response = post('/register',
                new_name: "user22",
                new_username: "username22>'",
                new_email: "user22@fakeemail.com",
                new_password: "Password1")
      
      expect(response.status).to eq(200)
      expect(response.body).to include("<h4> Please ensure that: </h4>")
      expect(response.body).to include("<h4> * Your name or username does not contain any numbers or special characters </h4>")
    end
    it "responds with 200 status if email is invalid" do
      response = post('/register',
                new_name: "user22",
                new_username: "username22",
                new_email: "user22fakeemailcom",
                new_password: "Password1")
      
      expect(response.status).to eq(200)
      expect(response.body).to include("<h4> Please ensure that: </h4>")
      expect(response.body).to include("<h4> * The email entered is a valid email address </h4>")
    end
  end
  context "GET /:username" do
    it "responds with 200 status" do
      response = get("/username1")

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/peep/username1" method="POST">')
      expect(response.body).to include('<strong>user1</strong> (username1)</br>')
    end
  end
  context "POST /peep/:user_name" do
    it "responds with 200 status" do
      response = post("/peep/username1", peep_context: 'Hello')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h2><p>Your peep has been posted!</p></h2>')

      repo = PeepRepository.new
      expect(repo.all.length).to eq(5)
      expect(repo.all.last.context).to eq ('Hello')
    end
    it "responds with 200 status" do
      response = post("/peep/username1")

      expect(response.status).to eq(200)
      expect(response.body).to include('<h4><p>Sorry your peep was unable to post as it was empty!</p></h4>')
    end
    it "responds with 200 status" do
      response = post("/peep/usernotrecognised")

      expect(response.status).to eq(200)
      expect(response.body).to include('<h3>Sorry you cannot post a peep without being logged in</h3>')
    end
  end
  context "POST /login" do
    it "responds with 200 status" do 
      response = post("/login",
      login_username: 'usern',
      login_password: 'passwordtest')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h3> Sorry that username is not recognised - please try again!</h3>')
    end
  end
  context "POST /login" do
    it "responds with 200 status" do 
      response = post("/login",
      login_username: 'username1',
      login_password: 'fakepassword1')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h2><p>Welcome back user1 !</p></h2>')
    end
  end
end