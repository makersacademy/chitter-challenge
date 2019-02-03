require_relative 'web_helpers'

describe User do

  describe "#create" do

    it 'Must have a username on creation' do
      new_user = User.create
      expect(new_user.save).to eq false
      expect(new_user.errors.map { |error| error }).to include ["Username must not be blank"]
    end

    it 'Only accepts users with a valid email' do
      new_user = User.new
      new_user.email = 'not an email'
      expect(new_user.save).to eq false
      expect(new_user.errors.map { |error| error }).to include ["Email has an invalid format"]

    end

    it 'Must have unique username and email' do
      user1 = User.new email: 'emailaddress@email.com', username: 'user100'
      user1.save
      user2 = User.new email: 'emailaddress@email.com', username: 'user100'
      expect(user2.save).to eq false
      expect(user2.errors.map { |error| error }).to include ["Email is already taken"]
      expect(user2.errors.map { |error| error }).to include ["Username is already taken"]
    end

  end

end
