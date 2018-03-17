require "timeline"

describe Timeline, '.all' do
  it 'displays all the peeps' do

    result = Timeline.all

    peep = result.map(&:text)

    expect(peep).to include('My first tweet!')
  end

  describe '.user' do
    it "displays the users tweets on his homepage timeline" do

      result = Timeline.user(author)

      user_timeline = result.map(&:text)

      expect(user_timeline). to include('My personal tweet')
    end
  end
end
