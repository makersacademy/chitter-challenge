require "spec_helper"
require "rack/test"
require_relative '../../app'
require "peep_repository"
require "user_repository"
require 'date'

describe Application do

  include Rack::Test::Methods

  let(:app) { Application.new }


  context 'GET /peeps' do
    it 'should return a list of all peeps' do
      response = get('/peeps')


      expect(response.status).to eq 200
      expect(response.body).to include('<h1> Peeps </h1>')
      expect(response.body).to include('Hello - 2022-06-08 12:00:00')
    end
  end

  context 'GET /peeps/new' do
    it 'returns the form page for adding a peep' do
      response = get('/peeps/new')

      expect(response.status).to eq 200
      expect(response.body).to include('<form action="/peeps" method="POST">')
      expect(response.body).to include('<p>Message: <input type="text" name="content"></p>')
      expect(response.body).to include('<p>Click here to post: <input type="submit" value="Peep"></p>')
    end
  end

  context 'POST /peeps' do
    it "should post the peep" do
      response = post(
        '/peeps',
        content: 'There is a heatwave today!',
        date_time: DateTime.now,
        user_id: 1
      )

      expect(response.status).to eq 200
      expect(response.body).to include('Your peep has been added!')
    end

    it "returns an error 400 when the peep is empty" do
      response = post(
        '/peeps',
        content: "",
        date_time: DateTime.now,
        user_id: 1
      )

      expect(response.status).to eq 400
      expect(response.body).to include('<h1>Post your peep here!</h1>')
      expect(response.body).to include('<p>Please type your peep</p>')
    end
  end

  context "GET /signup" do
    it "sign up and create an account" do
      response = get('/signup')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Create an account</h1>')
      expect(response.body).to include('<p>Name: <input type="text" name="name"></p>')
    end
  end

  context 'POST /signup' do
    it "should create an account" do
      response = post(
        '/signup',
        name: "Twm",
        username: "TwmJam",
        email_address: "Twm@aol.com",
        password: "twm123"
      )

      expect(response.status).to eq 200
      expect(response.body).to include('Your account has been created!')
    end
  end
end