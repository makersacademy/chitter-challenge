require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # setup
  # before do
  #   create_test_post_with_tags('Test cooking post', ['cooking'])
  #   create_test_post_with_tags('Test programming post', ['programming'])
  # end

  context "GET /" do
    it "shows all the peeps" do
      response = get("/feed")
      expect(response.body).to include("Erykah Badu")
      expect(response.body).to include("BagLady")
      expect(response.body).to include("I pick my friends like I pick fruit")
      expect(response.body).to include("20-04-23 04:05:06")
    end
  end

  describe "Creating a new user" do
    context "GET /sign_up" do
      it "should get the form to create a new user" do
        response = get("/sign_up")
        expect(response.status).to eq(200)
        expect(response.body).to include('<input type="text" name="name" />')
        expect(response.body).to include('<input type="text" name="password" />')
      end
    end
  end


  describe "Creating a new peep" do
    context "GET /" do
      xit "should get the form to add a new peep" do
        response = get("/")
        expect(response.status).to eq(200)
        expect(response.body).to include('<form method="POST" action="/peeps">')
        expect(response.body).to include(
          '<input type="text" name="user_id" placeholder="User id">',
        )
        expect(response.body).to include(
          '<input type="text" name="message" placeholder="Message">',
        )
      end
    end

    context "POST /" do
      xit "should add the new peep" do
        response = post('/peeps', message: 'hello', user_id: '1')
  
        expect(response.status).to eq(200)

      end
    end
  end
end
