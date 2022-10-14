require "peep_repository"
require "peep.rb"
require 'dotenv/load'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test', user: ENV['MY_USER'], password: ENV['PASSWORD'] })
  connection.exec(seed_sql)
end

RSpec.describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  context "All method" do 
    it "Returns all information about the peeps" do 
      repo = PeepRepository.new
      peeps = repo.all

      expect(peeps.length).to eq(5) 

      expect(peeps[0].message).to eq("Message_1")
      expect(peeps[0].time_stamp).to eq("10:10:10")
      expect(peeps.first.user_id).to eq(1) 
    end 
  end 


  context "Find method" do 
    it "Returns information about the peep corresponding to id 2" do 
      repo = PeepRepository.new

      peep = repo.find(2)

      expect(peep.id).to eq(2) 
      expect(peep.message).to eq('Message_2') 
      expect(peep.time_stamp).to eq('11:11:11')
      expect(peep.user_id).to eq(1)

    end 
  end 

  context "Create method" do 
    it "Creates a new user" do 
      repo = PeepRepository.new

      new_peep = Peep.new
      new_peep.message = 'new_message'
      new_peep.time_stamp = '18:30:00'
      new_peep.user_id = 1
      repo.create(new_peep)
  
      peeps = repo.all
  
      expect(peeps.length).to eq(6)
      expect(peeps.last.message).to eq('new_message')
      expect(peeps.last.time_stamp).to eq('18:30:00')
      expect(peeps.last.user_id).to eq(1)

    end 
  end 
end 



