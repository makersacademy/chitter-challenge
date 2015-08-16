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
    peep_with_no_content = build(:peep, content: "")
    expect(peep_with_no_content.save).to be false
  end

  it 'cannot be created with content length over 140 characters' do
    peep_too_big = build(:peep, content: "#{string_over_140_characters}")
    expect(peep_too_big.save).to be false
  end
end