require 'peep'
require 'pg'

# describe Peep do
#     describe '.all' do
#         it 'returns all peeps' do
#           peep = Peep.create(title: "1st peep", peep: "hello world")
    
#           peeps = Peep.all
    
#           expect(peeps.length).to eq 1
#           expect(peeps.first.id).to eq peep.id
#           expect(peeps.first.title).to eq "1st peep"
#           expect(peeps.first.peep).to eq "hello world"
#         end
#       end

describe Peep do

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peep_manager (peep) VALUES ('hello world');")
    bookmarks = Peep.all

    expect(bookmarks).to include "hello world"
  end
end




    
    
end