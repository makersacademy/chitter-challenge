describe Message do 
  
  let!(:message) do 
    Message.create body: "This is a message", date: DateTime.now
  end
  
  it 'Has a body' do
    expect(message.body).to eq "This is a message"
  end
  
  it "Has a date of creation" do
    expect(message.date).to be_a Date
  end
end