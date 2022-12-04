require "spec_helper"
require "rack/test"
require_relative '../../app'


describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /' do
    it 'should return homepage and list of peeps' do
      response = get('/')
      
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
      expect(response.body).to include('<h3><a href="/login">Log in</a> or <a href="/signup">Sign up here!</a></h3>')
      expect(response.body).to include("<h4>Even though you're not currently logged in, here's a sneak peek at our content:</h4>")

      expect(response.body).to include('<strong>John Doe</strong')
      expect(response.body).to include('@johndoe1234')
      expect(response.body).to include('Hello world!')
      expect(response.body).to include('Posted: 10:00')

      expect(response.body).to include('<strong>John Doe</strong')
      expect(response.body).to include('@johndoe1234')
      expect(response.body).to include('Just ate lol')
      expect(response.body).to include('Posted: 13:47')

      # ...and so on for all other peeps in test database...

      expect(response.body).to include('<strong>Seinfeld Seinfeld</strong')
      expect(response.body).to include('@seinfeld_bot')
      expect(response.body).to include('No but really... what IS the deal with airline food?')
      expect(response.body).to include('Posted: 17:12')
      
      expect(response.body).to include('<h4><a href ="#top">Back to top!</a></h4>')
    end  
  end

  context "GET /signup" do
    it 'returns form to create new account' do
      response = get('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include ('<h4>Welcome to Chitter! Please enter the relevant information below:</h4>')

      expect(response.body).to include ('<form method="POST" action="/signup">')
      expect(response.body).to include ('<input type="email" name="email" placeholder="Enter an email">')
      expect(response.body).to include ('<input type="password" name="password" placeholder="Enter a password">')
      expect(response.body).to include ('<input type="text" name="name" placeholder="Enter your name">')
      expect(response.body).to include ('<input type="text" name="username" placeholder="Enter a username">')
      expect(response.body).to include ('<input type="text" name="bio" placeholder="Enter an account bio">')
      expect(response.body).to include ('<input type="submit" value="Sign Up!" />')

      expect(response.body).to include ('<h4>Still thinking about it? Please feel free to <a href="/">return home</a> for now</h4>')
    end
  end

  context "POST /signup" do
    xit 'returns 200 OK' do
      response = post('/signup?email=123@123.com&password=1234&name=Test Test&username=test123&bio=test')

      expect(response.status).to eq(200)
    end
  end

  context "GET /login" do
    it 'returns form to login to existing account' do
      response = get('/login')

      expect(response.status).to eq(200)
      expect(response.body).to include ('<h4>Hey! Welcome back to Chitter! Please enter the relevant information below:</h4>')

      expect(response.body).to include ('<form method="POST" action="/login">')
      expect(response.body).to include ('<input type="text" name="username" placeholder="Enter a username">')
      expect(response.body).to include ('<input type="password" name="password" placeholder="Enter a password">')
      expect(response.body).to include ('<input type="submit" value="Log in!"/>')

      expect(response.body).to include ("<h4>Don't feel like logging in right now? Please feel free to <a href='/'>return home</a> for now</h4>")
    end
  end
end