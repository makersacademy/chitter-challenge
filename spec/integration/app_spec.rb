require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before(:each) do 
    reset_accounts_table
  end

  context " GET /" do
    it "takes user to a homepage page" do
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
      expect(response.body).to include('<h3>Sign up <a href="/accounts/new">here</a></h3>')
      expect(response.body).to include('<h3>Or log in <a href="/login">here</a></h3>')
    end
  end

  context "GET /login" do
    it "takes user to a login page" do
      response = get('/login')
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Please enter your details below:</h1>')
      expect(response.body).to include('<input type="text" name="email" required>')
      expect(response.body).to include('<input type="text" name="password" required>')
    end
  end

  context "GET /logout" do
    it "takes user to a logout page" do
      response = get('/logout')
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Are you sure you want to logout?</h1>')
      expect(response.body).to include('If yes, hit the button below')
      expect(response.body).to include('<form action="/logout" method="POST">')
    end
  end

  context "POST /logout" do
    it "logs the user out and takes them to homepage" do
      response = post('/logout')
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
      expect(response.body).to include('<h3>Sign up <a href="/accounts/new">here</a></h3>')
      expect(response.body).to include('<h3>Or log in <a href="/login">here</a></h3>')
    end
  end

  context "GET /feed" do
    it 'returns 200 OK and list of peeps as HTML page with links' do
      response = get('/feed')
      expect(response.status).to eq(200)
      expect(response.body).to include 'Tom Seleiro <a href="/accounts/1"> (TomS)</a>'
      expect(response.body).to include 'Contents 1'
      expect(response.body).to include '2022-12-01 01:08:54.193'
      expect(response.body).to include 'Robbie Kirkbride <a href="/accounts/2"> (rwmk)</a>'
      expect(response.body).to include 'Chris Hutchinson <a href="/accounts/4"> (HutchyC)</a>'
    end
  end

  context "GET /accounts" do
    it 'returns the list of accounts' do
      response = get('/accounts')
      expect(response.status).to eq 200
      expect(response.body).to include 'Tom Seleiro'
      expect(response.body).to include 'Shah Hussain'
      expect(response.body).to include 'Robbie Kirkbride'
    end
  end

  context "GET /accounts/:id" do
    it 'returns a specific account, id = 1' do
      response = get('/accounts/1')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Account: Tom Seleiro (TomS)</h1>')
      expect(response.body).to include('Contents 1')
    end

    end

    it 'returns a specific account, id = 3' do
      response = get('/accounts/3')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Account: Shah Hussain (SH99)</h1>')
      expect(response.body).to include('Contents 3')
    end

    it 'account pages have a link back to main feed' do
      response = get('/accounts/3')
      expect(response.status).to eq(200)
      expect(response.body).to include('<a href="/feed"> Go to main feed</a>')
    end

  context "POST /accounts/:id/peeps" do
    it "should validate peep parameters" do
      response = post('/accounts/2/peeps', invalid_peep_content: 'This should not work', another_invalid_thing: 123)
      expect(response.status).to eq 400
    end

    it "creates a peep. List peeps to check creation" do
      response = post('/accounts/2/peeps', contents: 'My first creation', time: '2022-12-12 12:12:12', account_id: 2)
      expect(response.status).to eq 200
      expect(response.body).to include('Your peep was posted!')
      expect(response.body).to include('<a href="/feed"> Go to main feed</a>')
      expect(response.body).to include('<a href="/account_page"> Go to my account</a>')

      response = get('/accounts/2')
      expect(response.body).to include('My first creation')
    end
  end

  context "POST /accounts" do
    it "should validate account parameters" do
      response = post('/accounts', invalid_account_content: 'This should not work', another_invalid_thing: 123)
      expect(response.status).to eq 400
    end

    it "should create an account. List accounts to check creation" do
      response = post('/accounts', email: 'sam@gmail.com', password: '1234', name: 'Sam Smith', username: 'Smithy')
      expect(response.status).to eq 200
      expect(response.body).to include('Well done! Account created!')
      expect(response.body).to include('<a href="/login"> Please login</a>')

      response = get('/accounts')
      expect(response.body).to include('Sam Smith')
    end
  end

  context " GET /login" do
    it "takes user to a login page" do
      response = get('/login')
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Please enter your details below:</h1>')
      expect(response.body).to include('<input type="text" name="email" required>')
      expect(response.body).to include('<input type="text" name="password" required>')
      expect(response.body).to include('<input type="submit" value="Submit" />')
    end
  end
end