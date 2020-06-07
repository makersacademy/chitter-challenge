require './lib/message'

describe "Message" do
  it "has an author, body and date" do
    peep = Message.new('Victor', 'Hello Chitter!', '2020-06-07 21:54:00')
    expect(peep.author).to eq 'Victor'
    expect(peep.body).to eq 'Hello Chitter!'
    expect(peep.date).to eq '2020-06-07 21:54:00'
  end
  it '#.all returns all peeps' do
    peep = Message.new('Victor', 'Hello Chitter!', '2020-06-07 21:54:00')
    peep2 = Message.new('John', 'Just got hired!', '2020-02-19 10:00:10')

    peeps = Message.all

    expect(peeps).to include( { :author => 'John', :body => 'Just got hired!', :date => '2020-02-19 10:00:10' } )
    expect(peeps).to include( { :author => 'Victor', :body => 'Hello Chitter!', :date => '2020-06-07 21:54:00' } )
  end
end