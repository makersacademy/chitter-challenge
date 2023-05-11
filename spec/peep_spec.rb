require 'peep'

RSpec.describe Peep do
  it 'formats the date' do
    peep = Peep.new
    peep.time_posted = Time.new(2023, 5, 11, 13, 27, 0)
    expect(peep.formatted_time).to eq '11 May 2023 at 13:27'
  end

  context 'there is no time_posted' do
    it '#formatted_time returns nil' do
      peep = Peep.new
      expect(peep.formatted_time).to eq nil
    end
  end
end