require 'message'

describe Message do
  before(:each) do
    clean_database
    User.create(
      :username       => 'Tifa',
      :email          => "seventhheaven@gmail.com",
      :password       => "jugsandfists"
    )
  end

  it 'expects to find a message' do
    Message.create(
      :body       => "This is a message here",
      :userid     => 1,
      :time => "Tuesday"
    )
    message = Message.first(:body => "This is a message here")
    expect(message['body']).to eq "This is a message here"
  end
end
