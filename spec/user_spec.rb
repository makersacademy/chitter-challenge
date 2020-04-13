require 'user'

describe User do

  let (:johnsmith) {User.new(username: 'John Smith', password: "password123")}

  it 'creates new user with username and password' do
    
    expect(subject.username).to eq 'John Smith'
    expect(subject.password).to eq 'password123'
  end

end