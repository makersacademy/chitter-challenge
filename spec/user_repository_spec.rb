require "user_repository"
require "shared_context_spec"
require "bcrypt"

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
      allow(user1).to receive(:username) {"changwynn"}
      allow(user1).to receive(:email) {"trash-garbage-bin@gmail.com"}
      result = subject.exist?(user1)
      expect(result).to eq true
    end
    it "should return true if email already exist" do
      allow(user1).to receive(:email) {"huynhchang@gmail.com"}
      result = subject.exist?(user1)
      expect(result).to eq true
    end
    it "should return false if user does not exist in the database" do
      result = subject.exist?(new_user)
      expect(result).to eq false
    end
  end

  context ".create method" do
    it "should add a new user to the database" do
      subject.create(new_user)
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
  context ".update_password method" do
    it "should return with a message if the current password submitted is incorrect" do
      subject.create(new_user)
      user = subject.find_by_id(4)
      current_password = "w1ck3d"
      new_password = "W1CK3D"
      result = subject.update_password(user, current_password, new_password)
      expect(result).to eq "Current password incorrect"
    end
    it "should update the password when password check is successfull" do
      subject.create(new_user)
      user = subject.find_by_id(4)
      current_password = "w1ck3d+"
      new_password = "W1CK3D"
      result = subject.update_password(user, current_password, new_password)
      expect(result).to eq "Password successfully updated"

      previous = user.password
      updated = subject.find_by_id(4).password
      expect(previous == updated).to eq false
    end
  end
end