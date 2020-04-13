require 'user'

describe User do
  it "Can call #all method on the Peep class" do
    expect(User).to respond_to :all
  end
end

describe User do
  #temp remove arguments section
  it "responds to #create" do
    expect(User).to respond_to(:create)#.with(4).arguments
  end
end

describe '.create' do
  it 'creates a new user' do
    User.create(name: 'Alex', handle: 'Alex1', email: 'test email', password: 'password')

    expect(User.all).to include "name: Alex handle: Alex1 email: test email password: password"
  end
end
