require './lib/Entry'

describe "displays all peeps" do
  it "allows all peeps to be displayed from database" do
  connection = PG.connect(dbname: 'chitter_test')
  
      entry = Entry.all
      expect(entry.last.text).to eq("first")
  end
end