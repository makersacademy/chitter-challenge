describe Peep do
  describe '.all' do
    it "shows all peeps" do
      allow(Time).to receive(:now).and_return(Time.new(2022,06,12,9,45,0))
      peep_test = Peep.create(content: dummy_text)
      persisted_data = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{peep_test.id};")
      Peep.create(content: "hello there")
      Peep.create(content: "blah blah")
      expect(Peep.all.size).to eq 3
      expect(Peep.all.first.content).to eq dummy_text
      expect(Peep.all.first.id).to eq persisted_data.first['id']
      expect(Peep.all.first.time_created).to eq "Sunday 12 June 2022, 09:45AM"
    end
  end

  describe '.create' do
    it "adds a new peep" do
      peep = Peep.create(content: dummy_text)
      expect(Peep.all.first.content).to eq peep.content
    end
  end
end