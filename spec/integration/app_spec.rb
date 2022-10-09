require 'spec_helper'
require 'rack/test'
require_relative '../../app'

RSpec.describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET /' do
    it 'returns the homepage in HTML with links to feed & compose' do
      @response = get('/')

      ok?
      copy_test('<h1>Welcome To Chitter</h1>')
      copy_test("<a href='peeps'> See all peeps </a>")
      # copy_test("<a href='peeps/new'> Compose a peep </a>")
    end
  end

  context 'GET /peeps' do
    it 'should return a list of peeps in HTML' do
      @response = get('/peeps')

      ok?
      copy_test('<h1>Chitter Feed</h1>')
      copy_test('First peep babeh!')
      copy_test('Just started at makers')
    end

    it 'should include the time the peep was sent' do
      @response = get('/peeps')

      ok?
      copy_test('<h1>Chitter Feed</h1>')
      copy_test('First peep babeh!')
      copy_test('Just started at makers')
      copy_test('2022-09-12 09:15:00')
    end

    it 'should show peeps in reverse chronological order' do
      @response = get('/peeps')

      ok?
      copy_test('<h1>Chitter Feed</h1>')
      copy_test('First peep babeh!')
      copy_test('Just started at makers')
      copy_test('2022-09-12 09:15:00')
    end

    it 'should include the peep author' do
      @response = get('/peeps')

      ok?
      copy_test('<h1>Chitter Feed</h1>')
      copy_test('Just started at makers')
      copy_test('2022-09-12 09:15:00')
      copy_test('@bennyboy')
    end
  end

  context "POST /peeps" do
    it "should add a new peep to the feed" do
      @response = post('/peeps', content: 'Hello world', time: '2022-10-06 18:00:00', user_id: 1)

      ok?
      expect(@response.body).to eq('')

      @response = get('/peeps')
      copy_test('Hello')
    end
  end

  context "GET /peeps/new" do
    it "returns an html form to add a new peep" do
      @response = get('/peeps/new')

      ok?
      copy_test('<form method="POST" action="/peeps">')
      copy_test('<input type="text" name="content"')
      copy_test('<select name="user_id">')
    end
  end

  context "POST /users" do
    it "should add a new user to the database" do
      @response = post('/users', first_name: 'David', last_name: 'Beckham', username: 'db7', email: 'bendit@db7.com', password: 'benditin')

      ok?
      expect(@response.body).to eq('')

      @response = get('/users')
      copy_test('David')
    end
  end

  context 'GET /users' do
    it 'should return a list of users in HTML' do
      @response = get('/users')

      ok?
      copy_test('<h1>User list</h1>')
      copy_test('Benedict')
      copy_test('Smith')
      copy_test('bennyboy')
      copy_test('ben@gmail.com')
    end
  end

  context "GET /users/new" do
    it "returns an html form to enter user details" do
      @response = get('/users/new')

      ok?
      copy_test('<form method="POST" action="/users">')
      copy_test('<input type="text" name="first_name"')
      copy_test('<input type="text" name="last_name"')
      copy_test('<input type="text" name="username"')
      copy_test('<input type="text" name="email"')
      copy_test('<input type="text" name="password"')
    end
  end

  context "GET /login" do
    it "returns an html form so you can log in" do
      @response = get('/login')

      ok?
      copy_test('<form method="POST" action="/login">')
      copy_test('<input type="text" name="username"')
      copy_test('<input type="text" name="password" />')
    end
  end

  context "POST /login" do
    it "success: returns the successful login page if username & password match records" do
      @response = post('/login', first_name: 'Benedict', last_name: 'Smith', username: 'bennyboy',
        email: 'ben@gmail.com', password: '123bento')
      ok?
      copy_test('<h1> Successful login Benedict! </h1>')
      copy_test("<a href='login/new_peep'> Compose a Peep</a>")
    end

    it "error: returns the error login page if username & password do not match records" do
      @response = post('/login', first_name: 'Pablo', last_name: 'Escobar', username: 'kingpin',
        email: 'plata@plomo.com', password: 'loveh1ppos')
      ok?
      copy_test("<h1> We couldn't log you in. </h1>")
      copy_test("<a href='..'> Login </a>")
    end
  end

  context "GET /login/new_peep" do
    it "returns an HTML page that recognises the user and produces a form to peep" do
      @response = get('/login/new_peep')

      ok?
      copy_test('<form method="POST" action="/peeps">')
      copy_test("<h1> Welcome Benedict </h1>")
      copy_test('<input type="text" name="content" />')
      # copy_test('<select name="user_id">')
    end
  end


  private

  def ok?
    expect(@response.status).to eq(200)
  end

  def copy_test(text)
    expect(@response.body).to include(text)
  end

end