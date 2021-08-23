require 'peep'

describe Peep do

  describe ".all" do 
  it 'returns a list of statuses' do
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (id, username, peep) VALUES (1, 'faryahussain', 'I am using chitter');")
    expect(Peep.all).to include('I am using chitter')

  end
end

describe ".create" do
  it "creates a new status" do
      Peep.create(peep: 'I am using chitter')
    expect(Peep.all).to include 'I am using chitter'
  end
end


end