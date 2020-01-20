require 'peep'

describe Peep do

  let(:subject) { Peep }

  describe "#all" do
    it "starts with an empty list of peeps" do
      connection = PG.connect(:dbname => 'chitter_test')
      connection.exec('TRUNCATE TABLE peeps;')

      expect(subject.all.length).to eq 0
    end
  end

  describe "#add" do
  it "creates a new peep and stores it in peeps table" do
    subject.add('Hello Chitter')

    expect(subject.all[0].peep).to eq 'Hello Chitter'
    expect(subject.all[0].time).to eq Time.now.strftime('%k:%M')
  end
end
  
end