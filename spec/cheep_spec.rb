require 'cheep'

describe Cheep do

  let(:handle) { '@celinedione' }
  let(:name) { 'Celine Dione' }
  let(:message) { 'My heart will go on' }
  let(:time) { Time.now }
  let(:cheep_instance) { Cheep.new(name, handle, message, time) }

  it "should respond to handle" do
    expect(cheep_instance.handle).to eq handle
  end

  it "should respond to name" do
    expect(cheep_instance.name).to eq name
  end

  it "should respond to message" do
    expect(cheep_instance.message).to eq message
  end

  it "should respond to time" do
    expect(cheep_instance.time).to eq time
  end

  describe ".create" do
    it "should create a new Cheep" do
      cheep = Cheep.create(name, handle, message, time)
      expect(Cheep.all).to include cheep
    end
  end

  describe ".all" do
    it "should return all Cheeps" do
      cheep = Cheep.create(name, handle, message, time)
      cheep_2 = Cheep.create('Whitney', '@houston', 'I wanna dance with somebody', time)
      expected_result = [cheep, cheep_2]
      expect(Cheep.all).to eq(expected_result)
    end
  end

  describe '#==' do
    it 'two Cheeps are equal if their handles match' do
      cheep_1 = Cheep.new(name, handle, message, time)
      cheep_2 = Cheep.new(name, handle, message, time)
      expect(cheep_1).to eq cheep_2
    end
  end
end
