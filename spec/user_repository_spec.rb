require 'user_repository'

RSpec.describe UserRepository do
  let(:repo) { UserRepository.new }

  describe "#find(id)" do
    it "returns User object by record id" do
      user = repo.find(3)
      expect(user.id).to eq 3
      expect(user.email).to eq 'jj@gmail.com'
      expect(user.password).to eq nil
      expect(user.name).to eq 'Jey Jey'
      expect(user.username).to eq 'jjj'
    end
  end

  describe "#find_by_email(email))" do
  it "returns User object by email" do
    user = repo.find_by_email('jenny@gmail.com')
    expect(user.id).to eq 2
    expect(user.password).to eq nil
    expect(user.email).to eq 'jenny@gmail.com'
    expect(user.name).to eq 'Jenny Zu'
    expect(user.username).to eq 'jennyzz'
  end
end

  describe "#find_with_mentions(id)" do
    it "returns User object by record id, with mentions" do
      user = repo.find_with_mentions(3)
      expect(user.id).to eq 3
      expect(user.email).to eq 'jj@gmail.com'
      expect(user.password).to eq nil
      expect(user.name).to eq 'Jey Jey'
      expect(user.username).to eq 'jjj'
      expect(user.mentions.length).to eq 2
      expect(user.mentions.first.id).to eq 1
      expect(user.mentions.first.peep_id).to eq 6
      expect(user.mentions.first.user_id).to eq 3
      expect(user.mentions[1].peep_id).to eq 7
    end
  end

  describe "#create" do
    it "addss user record from User object" do
      user = double(:user, email: 'four@gmail.com', password: 'temppass4',
                    name: 'Ferro', username: 'ferro')
      repo.create(user)
      latest_user = repo.find(4)
      expect(latest_user.id).to eq 4
      expect(latest_user.email).to eq 'four@gmail.com'
      expect(latest_user.password).to eq nil
      expect(latest_user.name).to eq 'Ferro'
      expect(latest_user.username).to eq 'ferro'
    end
  end
end
