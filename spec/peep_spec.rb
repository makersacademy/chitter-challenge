require 'peep'

RSpec.describe Peep do
  xit 'constructs' do
    time = double :time, now: Time.new(2022, 0o6, 12, 15, 49, 0o2)
    peep = Peep.add('my wife just left me', time)
    expect(Peep.all).to eq [['my wife just left me', '15:49:00']]
  end

  xit 'shows a different peep' do
    time = double :time, now: Time.new(2022, 0o6, 12, 17, 30, 0o2)
    peep = Peep.add('my wife came back!', time)
    expect(Peep.all).to eq [['', '', 'my wife came back!', '17:30:00']]
  end

  describe ".double_apostrophe" do
    it 'does nothing if no apostrophe is present' do
      expect(Peep.double_apostrophe('my wife came back!')).to eq 'my wife came back!'
    end

    it 'doubles an apostrophe if present' do
      expect(Peep.double_apostrophe("What's your favourite colour?")).to eq "What''s your favourite colour?"
    end
  end

  describe 'self.all' do
    xit 'shows a peep that has been created' do
      time = double :time, now: Time.new(2022, 0o6, 12, 17, 30, 0o2)
      Peep.add("What's your favourite colour?", time)
      expect(Peep.all).to eq [["What's your favourite colour?", "17:30:00"]]
    end

    xit 'shows mutliple peeps that have been created, in reverse chronological order' do
      time = double :time, now: Time.new(2022, 0o6, 12, 17, 30, 0o2)
      second_time = double :time, now: Time.new(2022, 0o6, 12, 17, 45, 0o2)
      Peep.add("What's your favourite colour?", time)
      p Peep.all
      Peep.add("Loving the sunshine!!!", second_time)
      p Peep.all
      expect(Peep.all).to eq [["Loving the sunshine!!!", "17:45:00"], ["What's your favourite colour?", "17:30:00"]]
    end

    context 'user has signed up' do
      it 'shows the name, the username, the post, and the time' do
        time = double :time, now: Time.new(2022, 0o6, 12, 17, 30, 0o2)
        user = double :user, name: "John Pie", username: "johnjohn!"
        Peep.add("What's your favourite colour?", time, user)
        expect(Peep.all).to eq [["John Pie", "johnjohn!", "What's your favourite colour?", "17:30:00"]]
      end
    end
  end
end
