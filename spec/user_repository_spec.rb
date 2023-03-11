require "user_repository"
require "shared_context_spec"

describe UserRepository do

  include_context "doubles setup"

  before { reset_users_table }
  before { reset_peeps_table }
  
  # let(:user_repo) { UserRepository.new }
  let(:user) { User.new }

  context ".find method" do
    it "should return the corresponding user given the username" do
      result = subject.find("changwynn")
      expect(result.fullname).to eq "Chang Huynh"
      expect(result.username).to eq "changwynn"
      expect(result.email).to eq "huynhchang@gmail.com"
      expect(result.password).to eq "passworD+123"
      expect(result.peeps[0].content).to eq "How are you guys doing, today? @jdoe @mrbike"
    end
    it "should return the corresponding user given an email address" do
      result = subject.find("huynhchang@gmail.com")
      expect(result.fullname).to eq "Chang Huynh"
      expect(result.username).to eq "changwynn"
      expect(result.email).to eq "huynhchang@gmail.com"
      expect(result.password).to eq "passworD+123"
      expect(result.peeps[0].content).to eq "How are you guys doing, today? @jdoe @mrbike"
    end
    it "should return nil if the user is not found" do
      result = subject.find("terminator")
      expect(result).to be nil
    end
  end

  context ".check method" do
    it "should check username existence in the database" do
      user.fullname = "Chang Wynn"
      user.username = "changwynn"
      user.email = "trash-garbage-bin@gmail.com"
      user.password = "12345Abcde+"
      result = subject.exist?(user)
      expect(result).to eq true
    end
    it "should return true if email already exist" do
      user.fullname = "Chang Wynn"
      user.username = "chang-wynn"
      user.email = "huynhchang@gmail.com"
      user.password = "12345Abcde+"
      result = subject.exist?(user)
      expect(result).to eq true
    end
    it "should return false if username or email don't already exist" do
      user.fullname = "John Wick"
      user.username = "wickedman"
      user.email = "imsowicked@gmail.com"
      user.password = "w1ck3d+"
      result = subject.exist?(user)
      expect(result).to eq false
    end

    context ".create method" do
      it "should add a new user to the database" do
        user.fullname = "John Wick"
        user.username = "wickedman"
        user.email = "imsowicked@gmail.com"
        user.password = "w1ck3d+"
        subject.create(user)
        result = subject.find("wickedman")
        expect(result.fullname).to eq "John Wick"
        expect(result.username).to eq "wickedman"
        expect(result.email).to eq "imsowicked@gmail.com"
      end
      it "should return nil if the user already exist" do
        user.fullname = "Chang Wynn"
        user.username = "changwynn"
        user.email = "trash-garbage-bin@gmail.com"
        user.password = "12345Abcde+"
        result = subject.create(user)
        expect(result).to be nil
      end
      it "should return nil if the user already exist" do
        user.fullname = "Chang Wynn"
        user.username = "chang-wynn"
        user.email = "huynhchang@gmail.com"
        user.password = "12345Abcde+"
        result = subject.create(user)
        expect(result).to be nil
      end
    end
  end
end