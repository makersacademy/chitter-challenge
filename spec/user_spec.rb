require_relative 'web_helpers'

describe User do

  describe "#create" do

    it 'Must have a username on creation' do
      new_user = User.create
      expect(new_user.save).to eq false
      expect(new_user.errors.map { |error| error }).to include ["Username must not be blank"]
    end

  end

  end
