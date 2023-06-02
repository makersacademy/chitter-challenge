require "spec_helper"
require "rack/test"
require_relative '../app'

def reset_chitter_db
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do 
    reset_chitter_db
  end
  
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods
  let(:app) { Application.new }
  
  context "GET /" do
    it 'shows the Feed' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Chitter</h1>")
      expect(response.body).to include("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    end
  end
  
  context "GET /peep/:id" do
    it "returns a specific Peep" do
      response = get('/peep/4')
      expect(response.status).to eq(200)
      expect(response.body).to include("Labore et dolore magna aliqua.")
    end
  end
  
  context "GET /peep/new" do
    it "returns the new Peep form" do
      response = get('/peep/new')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>New Peep</h1>")
    end
  end
  
  context "POST /peep" do
    it "adds a new Peep" do
      response = post('/peep', content: 'Similique atque dolor accusamus doloribus.', maker_id: 1)
      expect(response.status).to eq(200)
      
      response = get('/')
      expect(response.body).to include('Similique atque dolor accusamus doloribus.')
    end
  end
  
  context "GET /maker/new" do
    it "shows the Maker registration form" do
      response = get('/maker/new')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Register for Chitter</h1>")
    end
  end
  
  context "POST /maker" do
    it "adds a new Maker" do
      response = post('/maker', name: 'Chelsea Treutel', email: 'chelsea.treutel@gmail.com', password: "1234")
      expect(response.status).to eq(200)
      
      makers = MakerRepository.new.all
      expect(makers.last.name).to eq("Chelsea Treutel")
      expect(BCrypt::Password.new(makers.last.password)).to eq("1234")
    end
  end
end
