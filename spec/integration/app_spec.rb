require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  #Tests index page
  context "GET /" do
    it "returns 200 OK with homepage" do
      response = get("/")

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chitter</h1>')
    end
  end

  #Tests 404 page
  context "GET / random page" do
    it "returns 404" do
      response = get("/rsjkf")

      expect(response.status).to eq(404)
      expect(response.body).to eq("There is nothing out here, go back!")
    end
  end

  # #tests logging in - successfully
  # context "POST /login details" do
  #   xit "returns 200 OK - logs in" do

  #     response = post("/submit", username:"Jez", password:'$2a$12$p.Y/6iCFDysMR6BquOIkDuopbb0/VkXyKk2YlT2Ihf5OiVH5zz.pW')

  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq("login successful")
  #   end
  # end

  # #tests logging in - unsuccessfully
  # context "POST /login details" do
  #   xit "returns 200 OK - fails log in" do

  #     response = post("/submit", username:"Jez", password:'hello')

  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq("login unsuccessful")
  #   end
  # end

  context "POST /signup" do
    it "returns 302 Redirect - submits user/pass into db" do

      response = post(
        '/signup',
        username: 'Testuser001',
        password: 'TestPass001'
      )

      ### get last username from db to fin test

      expect(response.status).to eq(302)
      
    end
  end



  context 'POST /peep' do
    it 'Posts a new peep' do
      response = post('/peep',
        user_id: 1,
        message: "testing"
      )

      ### get last post see if it matches test
      response = get(/)

      expect(response.status).to eq(302)
    end
  end
end


#######################################################


context "Get /user/:id" do
  xit "returns 200 OK - error user doesn't exist" do

    response = get("/users/:id")

    expect(response.status).to eq(200)
    expect(response.body).to eq("user doesnt exist")
  end
end

context "Get /user/:id" do
  xit "returns 200 OK - error user doesnt exist" do

    response = get("/users/:id")

    expect(response.status).to eq(200)
    expect(response.body).to eq("user doesnt exist")
  end
end

context "Get /user/:id" do
  xit "returns 200 OK - view users page" do

    response = post("/submit", username:"Jez", password:'hello')

    expect(response.status).to eq(200)
    expect(response.body).to eq("users page")
  end
end

context 'GET /posts' do
  xit 'gets a list of posts' do
    response = get('/posts')

    expect(response.status).to eq(200)
    expect(response.body).to include('<body>flirting</body>')
  end
end