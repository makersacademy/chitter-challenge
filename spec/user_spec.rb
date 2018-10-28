require 'user'

describe User do
  it "gives user a name" do
    user = User.new('Imogen', 'imogenmisso123', 'imogenmisso@hotmail.co.uk', 'blueskies1')
    expect(user.name).to eq 'Imogen'
  end

  it "gives user a username" do
    user = User.new('Imogen', 'imogenmisso123', 'imogenmisso@hotmail.co.uk', 'blueskies1')
    expect(user.username).to eq 'imogenmisso123'
  end

  it "gives user an email" do
    user = User.new('Imogen', 'imogenmisso123', 'imogenmisso@hotmail.co.uk', 'blueskies1')
    expect(user.email).to eq 'imogenmisso@hotmail.co.uk'
  end

  it "gives user a password" do
    user = User.new('Imogen', 'imogenmisso123', 'imogenmisso@hotmail.co.uk', 'blueskies1')
    expect(user.password).to eq 'blueskies1'
  end

  it "creates a new user" do
    user = User.new('Imogen', 'imogenmisso123', 'imogenmisso@hotmail.co.uk', 'blueskies1')
    expect(user).to be_an_instance_of User
  end

  it "returns all details of a user with only username provided" do
    user = User.new('Imogen Misso', 'imogenmisso123', 'imogenmisso@hotmail.co.uk', 'blueskies1')
    details = User.find_details('imogenmisso123')
    expect(details[0].name).to eq 'Imogen Misso'
  end

end
