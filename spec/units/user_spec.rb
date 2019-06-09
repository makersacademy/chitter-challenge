require 'user'

describe User do
  before(:each) { truncates }
  # before(:each) { add_peep }

  it '#create adds a new User to database' do
    User.create('Dave', '@DavetheDev', 'dave@gmail.com', 'Dave1234')
    output = User.all
    expect(output.last.author).to eq('Dave')
    expect(output.last.handle).to eq('@DavetheDev')
    expect(output.last.email).to eq('dave@gmail.com')
    expect(output.last.password).to eq('Dave1234')
  end
end