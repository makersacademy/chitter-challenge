require_relative '../../app'
require 'rack/test'
require 'database_connection'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  def reset_chitter_table
    seed_sql = File.read('spec/seeds.sql')
    connection = DatabaseConnection.connect('chitter_test')
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_chitter_table()
  end

  context "post peep form" do
    it "returns the html form to post a new peep" do
      response = get('/')

      expect(response.status).to eq (200)
      expect(response.body).to include('<form method="POST" action="/">')
    end

    it "creates new peep on database direct" do
      repo = PeepRepository.new
      new_peep = Peep.new("TGIF everyone!", '2023-04-13 21:23:03.916851', 1)
      repo.create(new_peep)

      response = get('/')
      expect(response.status).to eq (200)
      expect(response.body).to include("TGIF everyone!")
    end

    it "creates new peep using form" do
      post_peep = post('/', username: 'EmmaJohnson', peep: "TGIF everyone!")
      response = get('/')
      expect(response.body).to include("TGIF everyone!")
    end

    it "creates new peep using POST" do
      post_peep = post('/', username: 'DanielAnderson', peep: "TGIF everyone!")
      response = get('/')
      expect(response.body).to include("TGIF everyone!")
    end
  end

  context "Peep timeline" do
    it "shows all peeps on main timeline" do
      response = get('/')
      expect(response.status).to eq (200)
      expect(response.body).to include "Just finished a great workout! #sweatyselfie"
      expect(response.body).to include "Why is it still night time?"
      expect(response.body).to include "Has anyone else noticed the strange creatures lurking around here?"
    end
    
    it "shows all the peeps of a single user" do
      response = get('/users/1')
      expect(response.status).to eq (200)
      expect(response.body).to include "Just finished a great workout! #sweatyselfie"
    end

    it "shows all the peeps of a different user" do
      response = get('/users/2')
      expect(response.status).to eq (200)
      expect(response.body).to include "Why is it still night time?"
    end
  end
end
