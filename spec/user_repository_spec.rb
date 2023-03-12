require "user_repository"
require "shared_context_spec"

describe UserRepository do

  include_context "doubles setup"

  before { reset_users_table }
  before { reset_peeps_table }
  
  let(:user) { User.new }
  
  context "find_by_id" do
    it "should return the corresponding user given its id" do
      result = subject.find_by_id(1)
      expect(result.fullname).to eq "Chang Huynh"
      expect(result.username).to eq "changwynn"
      expect(result.email).to eq "huynhchang@gmail.com"
      expect(result.password).to eq "passworD+123"
      expect(result.peeps[0].content).to eq "How are you guys doing, today? @jdoe @mrbike"
    end
    it "should return 'not found' if the user does not exist in the database" do
      result = subject.find(4)
      expect(result).to eq "not found"
    end
  end

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
    it "should return 'not found' if the user does not exist in the database" do
      result = subject.find("terminator")
      expect(result).to eq "not found"
    end
  end

  context ".exist? method" do
    it "should return true if username already exist" do
      user.fullname = "Chang Huynh"
      user.username = "changwynn"
      user.email = "trash-garbage-bin@gmail.com"
      user.password = "12345Abcde+"
      result = subject.exist?(user)
      expect(result).to eq true
    end
    it "should return true if email already exist" do
      user.fullname = "Chang Huynh"
      user.username = "chang-wynn"
      user.email = "huynhchang@gmail.com"
      user.password = "12345Abcde+"
      result = subject.exist?(user)
      expect(result).to eq true
    end
    it "should return false if user does not exist in the database" do
      user.fullname = "John Wick"
      user.username = "wickedman"
      user.email = "imsowicked@gmail.com"
      user.password = "w1ck3d+"
      result = subject.exist?(user)
      expect(result).to eq false
    end
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
    it "should return 'already exists' if the username is already taken" do
      user.fullname = "Chang Huynh"
      user.username = "changwynn"
      user.email = "trash-garbage-bin@gmail.com"
      user.password = "12345Abcde+"
      result = subject.create(user)
      expect(result).to eq "already exists"
    end
    it "should return 'already exists' if the email address is already registered" do
      user.fullname = "Chang Huynh"
      user.username = "chang-wynn"
      user.email = "huynhchang@gmail.com"
      user.password = "12345Abcde+"
      result = subject.create(user)
      expect(result).to eq "already exists"
    end
  end

  context ".update method" do
    it "should only update" do
      sql = "UPDATE users SET username = $1 WHERE id = $2"
      sql_params = ["chang-wynn", 1]
      result = subject.update(sql, sql_params)
      expect(result).to eq "The user profile has been successfully updated."
      user = subject.find("chang-wynn")
      expect(user.fullname).to eq "Chang Huynh"
      expect(user.username).to eq "chang-wynn"
      expect(user.email).to eq "huynhchang@gmail.com"
    end
  end
end