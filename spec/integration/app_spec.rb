require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "Get/signup"
  it "should return the form to sign up to Chitter" do
    response = get("/signup")
    expect(response.status).to eq(200)
    expect(response.body).to include("<h1> Sign up for Chitter </h1>")
    expect(response.body).to include('<form action="/signup" method="POST">')
  end

  context "get/"
  it "should return all peeps on the homepage" do
    response = get("/")
    expect(response.status).to eq (200)
    expect(response.body).to include ("<h1> Welcome to Chitter </h1>")
    expect(response.body).to include ("Hey peep I can help you!")
  end

  context "get/login"
  it "should return login page" do
    response = get("/login")
    expect(response.status).to eq (200)
    expect(response.body).to include ("Sign in to Chitter")
  end

  context "get/signup"
  it "should return signup page" do
    response = get("/signup")
    expect(response.status).to eq (200)
    expect(response.body).to include ("Sign up for Chitter")
  end

  context "get/peep/new"
  it "should post new peep" do
    response = get("/peep/new")
    expect(response.status).to eq (200)
    expect(response.body).to include ("<h1> Welcome to Chitter </h1>")
  end
end



