require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }


  def reset_both_tables
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end
  
  
  before(:each) do 
    reset_both_tables
  end

context "GET /" do
  it "homepage" do
    response = get('/')

    expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
    expect(response.body).to include('<a href="/peeps">View Peeps Here</a>')
  end
end

context "GET /peeps" do
  it "returns peeps in reverse chronological order" do
    response = get('/peeps')

    expect(response.body).to include('<h1>Peeps</h1>')
    expect(response.body).to include('<p>peep 1</p>')
    expect(response.body).to include('<p>peep 2</p>')
  end
end

context "GET /peeps/:id" do
  it "returns page of peeps from one user" do
    response = get('peeps/1')

    expect(response.body).to include '<h1>Peeps by David</h1>'
  end
end
end