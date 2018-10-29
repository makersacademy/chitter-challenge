require "./lib/communicationmanager.rb"
require "./lib/databaseconnection.rb"

require "./lib/user.rb"

describe Communicationmanager do

  it "sends email" do
    user = User.create(name: "John", password: "password", email: "email@hotmail.com", receive_email: "y")
    res = described_class.send_email(text: "Hello",recepients: ["John"], sender: "Tom")
    expect(res.length).to eq 1
  end

  it "Fetch all emails" do
    Databaseconnection.execute("insert into email (text, sender, receiver) values ('John','Hello there my friend','Tom');")
    Databaseconnection.execute("insert into email (text, sender, receiver) values ('John','How are you?','Tom');")
    expect(described_class.fetch_all_emails.length).to eq 2
  end

  it "sends no email" do
    described_class.send_email(text: "Hello",recepients: ["XXXYYYXXX"], sender: "Tom")
    result = Databaseconnection.execute("select * from email")
    expect(described_class.fetch_all_emails).to eq "No emails"
  end

end
