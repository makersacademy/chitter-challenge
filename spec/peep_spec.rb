require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('Whats up Chitter');")
    connection.exec("INSERT INTO peeps (peep) VALUES('What do you want to say?');")
    connection.exec("INSERT INTO peeps (peep) VALUES('I am hungry');")
    
    peeps = Peep.all 
    
    expect(peeps).to include("Whats up Chitter")
    expect(peeps).to include("What do you want to say?")
    expect(peeps).to include("I am hungry")
    
    end
  end
end

# describe Peep do

#   describe ".all" do 
#   it 'returns a list of statuses' do
#   connection = PG.connect(dbname: 'chitter_test')
#   connection.exec("INSERT INTO peeps (id, username, peep) VALUES (1, 'faryahussain', 'I am using chitter');")
#     expect(Peep.all).to include('I am using chitter')

#   end
# end

# describe ".create" do
#   it "creates a new status" do
#       Peep.create(peep: 'I am using chitter')
#     expect(Peep.all).to include 'I am using chitter'
#   end
# end


# end