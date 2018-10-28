require 'peep'

describe Peep do
  describe 'all' do
    it 'should show all peeps' do
      Peep.post(name: "steve", username: "stevie93", post: "my first peep!")
      Peep.post(name: "anouska", username: "hopkins94", post: "also my first peep!")
      peeps = Peep.all
      expect(peeps[0].name).to include("steve")
      expect(peeps[1].name).to include("anouska")
    end
  end
  describe 'post' do
    it 'should be able to post a peep' do
    Peep.post(name: "steve", username: "stevie93", post: "my first peep!")
    expect(Peep.all[0].name).to eq "steve"
    end
    it 'should be able to post a peep' do
    Peep.post(name: "steve", username: "stevie93", post: "my first peep!")
    expect(Peep.all[0].username).to eq "stevie93"
    end
    it 'should be able to post a peep' do
    Peep.post(name: "steve", username: "stevie93", post: "my first peep!")
    expect(Peep.all[0].post).to eq "my first peep!"
    end
  end
end
