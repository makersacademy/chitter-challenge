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
      expect(response.body).to include ('<h1>Welcome to Chitter!</h1>')

      expect(response.body).to include ('<form method="POST" action="/signup" style="width: 500px; margin:auto">')
      expect(response.body).to include ('<input type="email" class="form-control" name="email" placeholder="Enter your email!" required>')
      expect(response.body).to include ('<input type="password" class="form-control" name="password" placeholder="Enter your password!" required>')
      expect(response.body).to include ('<input type="text" class="form-control" name="name" placeholder="Enter your first and second name!" required>')
      expect(response.body).to include ('<input type="text" class="form-control" name="username" placeholder="Enter your desired username!" required>')
      expect(response.body).to include ('<input type="text" class="form-control" name="bio" placeholder="This is a short sentence that will go on your profile!">')
      expect(response.body).to include ('<button type="submit" class="btn btn-success">Sign Up</button>')

      expect(response.body).to include ('<button type="button" class="btn btn-danger">Cancel</button>')
    end
  end

  context "POST /signup" do
    it 'creates a new user' do
      response = post('/signup', email: 'eliza@mail.com', password: 'test_account', name: 'Eliza Test', username: 'Eliza123', bio: 'Test account')

      expect(response.status).to eq(302)
      repo = AccountRepository.new
      expect(repo.all.last.name).to eq 'Eliza Test'
      expect(repo.all.last.username).to eq 'Eliza123'
    end
  end

  context "GET /login" do
    it 'returns form to login to existing account' do
      response = get('/login')

      expect(response.status).to eq(200)
      expect(response.body).to include ('<h1>Welcome back to Chitter!</h1>')

      expect(response.body).to include ('<form method="POST" action="/login" style="width: 500px; margin:auto">')
      expect(response.body).to include ('<input type="email" class="form-control" name="email_address">')
      expect(response.body).to include ('<input type="password" class="form-control" name="password">')
      expect(response.body).to include ('<button type="submit" class="btn btn-success">Log In</button>')
      expect(response.body).to include ('<button type="button" class="btn btn-danger">Cancel</button>')
    end
  end

  context "GET /logged_in" do
    it 'returns login_success page' do
      new_account = post('/signup', email: 'eliza@gmail.com', password: 'test', name: 'Eliza Test', username: 'Eliza1234', bio: 'Test account')
      response = get('/logged_in')

      expect(response.status).to eq(200)

      expect(response.body).to include("<h1>Hey Eliza1234! How's it going?</h1>")

      expect(response.body).to include('<form method="POST" action="/peep/new" style="width: 500px;">')
      expect(response.body).to include('<input type="text" class="form-control" name="content" placeholder="Have your say!" required>')
      expect(response.body).to include('<button type="submit" class="btn btn-primary">Peep!</button>')
      expect(response.body).to include('<h4><a href ="#top">Back to top!</a></h4>')
    end
  end

  context "POST /peep/new" do
    it 'creates a new peep' do
      response = post('/peep/new', content: 'Test peep', post_time: '2022-12-11 13:10:32', account_id: '12')

      expect(response.status).to eq(302)
      repo = PeepRepository.new
      expect(repo.all.last.content).to eq 'Test peep'
    end
  end
end