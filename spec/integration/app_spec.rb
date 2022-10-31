require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
    include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
    let(:app) { Application.new }

    context 'GET /' do
        it "returns the posts in reverse chronological order" do
            response = get('/')
            expect(response.status).to eq(200)
            expect(response.body).to include('I can do this all day.')
        end
    end

    context 'GET /sign_up' do
        it "shows the sign up form" do
            response = get('/sign_up')
            expect(response.status).to eq(200)
            expect(response.body).to include('<div><p>Name:</p> <input type="text" name="name"></div>')
        end
    end

    context 'POSTS to /sign_up' do
        it "creates a new user through the sign up form" do
            response = post('/sign_up', name: 'Natasha Romanoff', username: 'Black Widow', email: 'widow@makersacademy.com', password: '12345678#')
            expect(response.status).to eq(200)
            expect(response.body).to include('Your data has been saved!')
        end
    end

    context 'GET /create_post' do
        it "shows the post form" do
            response = get('/create_post')
            expect(response.status).to eq(200)
            expect(response.body).to include('<div><p>User ID:</p> <input type="text" name="user_id"></div>')
        end
    end

    context 'POSTS to /create_post' do
        it "creates a post through the post form" do
            response = post('/create_post')
            expect(response.status).to eq(200)
            expect(response.body).to include('Your post has been sent!')
        end
    end

end