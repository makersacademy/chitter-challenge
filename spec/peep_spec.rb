require "peep"
require "timecop"
require "database_helpers"

describe Peep do
  let(:new_time) { Time.new(2021, 10, 16, 0, 0) }
  describe ".all" do
    it "shows all peeps" do
      Timecop.freeze(new_time) do
        peep = Peep.create(text: "First peep!", created_at: "#{new_time}")
        Peep.create(text: "Another peep!", created_at: "#{new_time}")
        peeps = Peep.all

        expect(peeps.length).to eq 2
        expect(peeps.first).to be_a Peep
        expect(peeps.first.id).to eq peep.id
        expect(peeps.first.created_at).to eq new_time
      end
    end
  end

  describe ".create" do
    it "creates a peep" do
      peep = Peep.create(text: "First peep!", created_at: "#{new_time}")
      persisted_data = persisted_data(id: peep.id)
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data["id"]
      expect(peep.text).to eq "First peep!"
    end
  end
end
