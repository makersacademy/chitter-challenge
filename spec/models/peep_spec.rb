require_relative '../../app/models/peep.rb'

describe Peep do
  def string_over_140_characters
    longstring = ""
    14.times do
      longstring << "dfghtyjkcbdsf "
    end
    longstring
  end

  it 'is created with a time stamp' do
    expect((create :peep).created_at).to be_truthy
  end

  it 'cannot be created without content' do
    should validate_presence_of :content
  end

  it 'cannot be created with content length over 140 characters' do
    peep_too_big = build(:peep, content: "#{string_over_140_characters}")
    expect(peep_too_big.save).to be false
  end
end