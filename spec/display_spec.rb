require './lib/Entry'

describe "displays all peeps" do
  it "allows all peeps to be displayed from database" do
      entry = Entry.all
      expect(entry.last.text).to eq("first")
  end
end