describe Peep do
  describe '.create' do
    it "creates new peeps" do
      allow(Time).to receive(:now).and_return(Time.new(2022,06,12,9,45,0))
      user = User.create(first_name: "Sophie", last_name: "Gilder", email: "sophie.macramazing@gmail.com", handle: "sophieg", password: "password123")
      peep_test = Peep.create(content: dummy_text, user_id: user.id)
      persisted_data = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{peep_test.id};")
      expect(Peep.all.size).to eq 1
      expect(Peep.all.first.content).to eq dummy_text
      expect(Peep.all.first.id).to eq persisted_data.first['id']
      expect(Peep.all.first.time_created).to eq "Sunday 12 June 2022, 09:45 AM"
      expect(Peep.all.first.user_id).to eq user.id
    end
  end
end