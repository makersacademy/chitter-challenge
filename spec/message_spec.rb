require './lib/message'

describe "Message" do
  it "has an author, body and date" do
    peep = Message.new(id: 1, author: 'Victor', body: 'Hello Chitter!', date: '2020-06-07 21:54:00')
    expect(peep.author).to eq 'Victor'
    expect(peep.body).to eq 'Hello Chitter!'
    expect(peep.date).to eq '2020-06-07 21:54:00'
  end
  it '#.all returns all peeps' do
    Message.add(author: 'Victor', body: 'Hello Chitter!', date: '2020-06-07 21:54:00')
    Message.add(author: 'John', body: 'Just got hired!', date: '2020-02-19 10:00:10')

    peeps = Message.all

    expect(peeps.length).to eq 2
  end

  it '#.add a new peep in the database' do
    peep = Message.add(author: 'Victor', body: 'Hello Chitter!', date: '2020-06-07 21:54:00')
    expect(peep.author).to eq 'Victor'
    expect(peep).to be_a Message
    expect(peep.body).to eq 'Hello Chitter!'
    expect(peep.date).to eq '2020-06-07 21:54:00'
    
  end
end
