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

end
