require_relative '../models/user'

describe User do
  it "has details that are added to the datatable" do
    john = User.create(name: "John Doe", username: 'JDoe123', email: 'johndoe@gmail.co.uk', password: 'Password123')
    first = User.first
    expect(first.name).to eq john.name
    expect(first.username).to eq john.username
    expect(first.email).to eq john.email
  end

  it "doesn't add duplicate usernames" do
    User.create(name: "John Doe", username: 'JDoe123', email: 'johndoe@gmail.co.uk', password: 'Password123')
    User.create(name: "Jane Doe", username: 'JDoe123', email: 'janedoe@gmail.co.uk', password: 'Password123')
    expect(User.where(name: "Jane Doe")).to be_empty
  end

  it "doesn't add duplicate emails" do
    User.create(name: "John Doe", username: 'JDoe123', email: 'johndoe@gmail.co.uk', password: 'Password123')
    User.create(name: "John Doe", username: 'JohnDoe123', email: 'johndoe@gmail.co.uk', password: 'Password123')
    expect(User.where(username: 'JohnDoe123')).to be_empty
  end

  it "password must be between 8 to 20 characters long" do
    User.create(name: "John Doe", username: 'JDoe123', email: 'johndoe@gmail.co.uk', password: 'this')
    User.create(name: "Jane Doe", username: 'JaneDoe123', email: 'janedoe@gmail.co.uk', password: 'buckminsterfullerene12')
    expect(User.where(name: 'John Doe')).to be_empty
    expect(User.where(name: 'Jane Doe')).to be_empty
  end
end
