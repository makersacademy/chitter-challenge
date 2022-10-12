require 'spec_helper'
require_relative '../../app'
require 'capybara'

Capybara.app = Application
 
RSpec.describe User do
  include Rack::Test::Methods

  let(:app) { Application.new }
  let!(:user) { FactoryBot.create(:user) }
  
  before :each do 
    user = User.create(
      id: 1,
      first_name: 'Dolly',
      last_name: 'See',
      email: 'dolly@dmail.com',
      username: 'dolly',
      password: 'abcde12345',
      password_confirmation: 'abcde12345'
    )
    peep1 = Peep.create(id: 1,
      content: 'Beautyful day',
      created_at: '2022-10-09 13:00:48 UTC',
      user_id: 1
    )
    peep2 = Peep.create(id: 2,
      content: 'Peep test',
      created_at: '2022-10-09 13:40:48 UTC',
      user_id: 1
    )
  end

  context 'GET /' do
    it 'displays homepage' do
      @response = get('/')

      respond_ok?
      test_body('<h1>Welcome to Chitter</h1>')
      test_body('<h3><a href="peeps">Peeps</a></h3>')
      test_body('Peep test, 2022-10-09 13:40:48 UTC<br />')
      test_body('Beautyful day, 2022-10-09 13:00:48 UTC<br />')
      test_body('<a href="signup">Sign Up</a><br />')
      test_body('<a href="signin">Sign In</a><br />')
    end
  end

  context 'GET /signup' do
    it 'gets signup form' do
      @response = get('/signup')

      respond_ok?
      test_body('<form action="/signup/new" method="POST">')
      test_body('<input type="string" name="email"><br />')
      test_body('<input type="string" name="username"><br />')
      test_body('<input type="password" name="password">')
      test_body('<input type="password" name="password_confirmation">')
      test_body('<input type="submit" value="Create">')
    end
  end

  context 'GET /signin' do
    it 'returns the signin form' do
      @response = get('/signin')
  
      respond_ok?
      test_body('<form action="/signin" method="POST">')
      test_body('<label>Email: </label>')
      test_body('<input type="string" name="email"><br />')
      test_body('<label>Password: </label>')
      test_body('<input type="password" name="password">')
      test_body('<input type="submit" value="Sign in">')
    end
  end

  context 'POST /signup/new' do
    it 'creates a new user with valid information' do
      @response = post(
        '/signup/new',
        first_name: 'Code',
        last_name: 'Kata',
        email: 'coder@cmail.com',
        username: 'coder',
        password: 'abcde12345',
        password_confirmation: 'abcde12345')

      respond_ok?
      test_body('Thank you for joining us!')
      test_body('Go to sign in to make your first peep')
      test_body('<a href="/signin">Sign in</a>')
    end

    it 'returns error messages with invalid information' do
      @response = post(
        '/signup/new',
        first_name: "",
        last_name: "",
        email: "",
        username: "",
        password: "",
        password_confirmation: "")
      
      respond_ok?
      test_body("First name can't be blank")
      test_body("Last name can't be blank")
      test_body("Email can't be blank")
      test_body("Username can't be blank")
      test_body("Password confirmation can't be blank")
      test_body("Password is too short (minimum is 10 characters)")
      test_body("Password confirmation doesn't match Password")
    end
  end

  context 'POST /signin' do
    it 'redirects to account page' do
      response = post(
        '/signin',
        email: 'dolly@dmail.com',
        password: 'abcde12345'
      )
     
      expect(response.status).to eq (302)
    end

    it 'returns error message with unmatched information' do
      @response = post(
        '/signin',
        email: 'dolly@dmail.com',
        password: 'abcde12'
      )

    respond_ok?
    test_body('Please check your email or password!')
    end
  end

  context 'GET /account/:id' do
    it 'returns the user account page' do
      @response = get('/account/1')
      
      respond_ok?
      test_body('Hello, dolly')
    end 
  end

  context 'POST /peep' do
    xit "creates a new peep record" do
      response = post(
        '/peep',
        content: 'Hello world'
        )
      
      expect(Peep.last.content).to eq('Hello world')
    end
  end
end

private

def respond_ok?
  expect(@response.status).to eq (200)
end

def test_body(context)
  expect(@response.body).to include(context) 
end