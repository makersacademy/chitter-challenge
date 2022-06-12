require 'peep.rb'

describe Peep do
  describe '.all' do
    it "shows all peeps" do
      peep_test = Peep.create(content: dummy_text, time_created: Time.now.to_s)
      Peep.create(content: "hello there", time_created: Time.now.to_s)
      Peep.create(content: "blah blah", time_created: Time.now.to_s)
      expect(Peep.all.size).to eq 3
      expect(Peep.all.first.content).to eq dummy_text
    end
  end

  describe '.create' do
    it "adds a new peep" do
      peep = Peep.create(content: dummy_text)
      expect(Peep.all.first.content).to eq peep.content
    end
  end
end