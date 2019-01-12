require './lib/message.rb'

RSpec.describe Message do
let(:time_double) {DateTime}
  it "has content attribute" do 
    first_message = Message.create(content: 'content')
    expect(first_message).to have_attributes(:content => 'content')
  end

  it "has time attribute" do 
    first_message = Message.create(created_at: time_double)
    expect(first_message).to have_attributes(:created_at => time_double)
  end

end