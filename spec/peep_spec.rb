require 'peep'

describe Peep do 
  let(:subject) { described_class.new('toby@gmail.com', '17/1/20 13:00', 'My test peep!') }
  
  describe '#initialization' do
    expect(subject.author).to eq 'toby@gmail.com'
    expect(subject.time).to eq '17/1/20 13:00'
    expect(subject.message).to eq 'My test peep!'
  end
end
  