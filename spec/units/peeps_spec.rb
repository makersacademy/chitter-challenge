require 'peeps'

describe Peeps do
  it 'creates a peep with an id and message body' do
      my_peep = Peeps.new(id:1, message: 'This is a test')
      expect(my_peep).to be Peeps
  end

  it 'can view peeps via .all class method' do
    my_peep = Peeps.new(id:1, message: 'This is a test')
    expect(Peeps.all).not_to be_empty
    expect(Peeps.all.message).to eq 'This is a test'
  end
end
