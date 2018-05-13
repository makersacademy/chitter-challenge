require './models/cheep'

describe Cheep do

  let(:handle) { '@celinedione' }
  let(:name) { 'Celine Dione' }
  let(:message) { 'My heart will go on' }
  let(:time) { Time.now }
  let(:id) { 20 }
  let(:cheep_instance) { Cheep.new(name, handle, message, time, id) }

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

  it "should respond to id" do
    expect(cheep_instance.id).to eq id
  end

  describe ".create" do
    it "should create a new Cheep" do
      expect{ Cheep.create(name, handle, message, time) }.to change{ Cheep.all.length }.from(0).to(1)
    end
  end

  describe ".all" do
    it "should return all Cheeps" do
      cheep = Cheep.create(name, handle, message, time)
      cheep_2 = Cheep.create(name, handle, message, time)
      expect(Cheep.all.length).to eq 2
    end
  end

end
