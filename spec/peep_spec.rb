require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      post = peeps.map(&:post)
      expect(post).to include("This is a test peep")
      expect(post).to include("This is another test peep")
    end
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peep.create('My first peep')
    peeps = Peep.all
    all = peeps.map(&:post)
    expect(all).to include 'My first peep'
  end
end

describe 'time' do
  it "peeps include the time submitted" do
      Peep.create("I love to peep")
      peeps = Peep.all
      peep_time = peeps.map(&:time)
      time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
      expect(peep_time).to include(time)
  end
end
