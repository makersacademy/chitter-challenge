require 'cheep'
require 'pg'
require 'timecop'

describe Cheep do

  let(:handle) { '@celinedione' }
  let(:name) { 'Celine Dione' }
  let(:message) { 'My heart will go on' }
  let(:cheep) { Cheep.new(handle, name, message) }

  it "should return the user's handle" do
    expect(cheep.handle).to eq handle
  end

  it "should return the user's name" do
    expect(cheep.name).to eq name
  end

  it "should return the user's message" do
    expect(cheep.message).to eq message
  end

  it "should return the time of the user's cheep" do
    time = Time.now
    Timecop.freeze(time)
    expect(cheep.time).to eq time
  end

end
