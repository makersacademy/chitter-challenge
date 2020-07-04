describe "Able to add peep to database" do
  xit "added peep is stored in database" do
      Entry.add("first")
      expect(Entry.all.last.text).to eq("first")
  end
end