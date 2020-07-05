require './lib/Entry'

describe "Able to add peep to database" do
  it "added peep is stored in database" do
    connection = PG.connect(dbname: 'chitter_test')
    
      Entry.add("first")
      expect(Entry.all.last.text).to eq("first")
  end
end