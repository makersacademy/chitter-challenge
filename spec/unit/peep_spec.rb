# Unit tests for the Peep class in the model (lib)

require 'peep'
require './spec/web_helpers'
require 'pg'

describe Peep do

  before(:each) do
    setup_tables
  end

  context 'Check_user' do
    it '- checks the user is in the database' do
      expect(Peep.user?("test@test.com")).to eq true
      expect(Peep.user?("bob@test.com")).to eq false
    end
  end

  context 'User creates a peep' do
    it '- method responds to correct # of arguments' do
      expect(Peep).to respond_to(:create).with(2).arguments
    end

    it '- checks the user is in the database' do
      expect(Peep.create("test@test.com", "Test post")).to eq "Post created"
      expect { Peep.create("bob@test.com", "Test post") }.to raise_error "Username not recognised"

    end

    it '- can store the peep in the database' do
      Peep.create("test@test.com", "Test post")
      connection = PG.connect(dbname: 'chittertest')
      result = connection.exec("SELECT 1 FROM peeps WHERE post = 'Test post';")
      expect(result.map { |line| line }).not_to eq []
    end

    it '- rejects a peep which is too long' do
      post = ""
      141.times do
        post += "x"
      end
      expect { Peep.create("test@test.com", post) }.to raise_error "Too many characters"
    end
  end

  it '- return date returns the full date of the post' do
    retrive_peep = DatabaseConnection.query("SELECT * FROM peeps WHERE id = 1;")
    expect(retrive_peep.map {
      |row| Peep.new(row['id'], row['datetime'], row['username'], row['post'])
    }[0].return_date).to eq "Monday 02 December 2019"
  end

  it '- return_time returns the time of the post without seconds' do
    retrive_peep = DatabaseConnection.query("SELECT * FROM peeps WHERE id = 1;")
    expect(retrive_peep.map {
      |row| Peep.new(row['id'], row['datetime'], row['username'], row['post'])
    }[0].return_time).to eq "10:00"
  end

end
