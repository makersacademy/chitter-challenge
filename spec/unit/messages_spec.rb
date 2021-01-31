require "./lib/message"

describe ".all" do
  it "returns a list of messages" do

    # Connect to the test database

    connection = PG.connect(dbname: 'message_manager_test')

    # Add test data

    connection.exec("INSERT INTO messages (message) VALUES ('Hey there!');")
    connection.exec("INSERT INTO messages (message) VALUES ('Blueberries');")
    connection.exec("INSERT INTO messages (message) VALUES ('Blue');")

    messages = Message.all

    expect(messages).to include("Hey there!")
    expect(messages).to include("Blueberries")
    expect(messages).to include("Blue")
  end
  
end

describe ".create" do
  it "creates a new message" do
    Message.create(message: "Well howdy there!")
    expect(Message.all).to include("Well howdy there!")
  end
end