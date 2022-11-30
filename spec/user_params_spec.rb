require 'user'
require 'user_repository'
require 'user_params'

RSpec.describe UserParams do
  describe "#invalid_email?" do
    context "given a valid email" do
      it "returns false" do
        user_params = UserParams.new('checkinguser', 'checkingusername', 'checking@email.com', 'checkingpassword')
        expect(user_params.invalid_email?).to eq(false)
      end
    end
    context "given an invalid email" do
      it "returns true" do
        user_params = UserParams.new('checkinguser', 'checkingusername', 'checkingemailcom', 'checkingpassword')
        expect(user_params.invalid_email?).to eq(true)
      end
    end
  end
  describe "#name_contains_incorrect_characters?" do
    context "given a valid name" do
      it "returns false" do
        user_params = UserParams.new('checkinguser', 'checkingusername', 'checking@email.com', 'checkingpassword')
        expect(user_params.name_contains_incorrect_characters?).to eq(false)
      end
    end
    context "given a invalid name" do
      it "returns true" do
        user_params = UserParams.new('chec*kingu>ser', 'checkingusername', 'checking@email.com', 'checkingpassword')
        expect(user_params.name_contains_incorrect_characters?).to eq(true)
      end
    end
  end
  describe "#username_contains_incorrect_characters?" do
    context "given a invalid username" do
      it "returns true" do
        user_params = UserParams.new('checkinguser', 'checki$ngus*erna>me', 'checking@email.com', 'checkingpassword')
        expect(user_params.username_contains_incorrect_characters?).to eq(true)
      end
    end
    context "given a valid name" do
      it "returns false" do
        user_params = UserParams.new('checkinguser', 'checkingusername', 'checking@email.com', 'checkingpassword')
        expect(user_params.username_contains_incorrect_characters?).to eq(false)
      end
    end
  end
  describe "#password_contains_incorrect_characters?" do
    context "given a invalid password" do
      it "returns true" do
        user_params = UserParams.new('checkinguser', 'checkingusername', 'checking@email.com', 'check>ingpas#sword')
        expect(user_params.password_contains_incorrect_characters?).to eq(true)
      end
    end
    context "given a valid name" do
      it "returns false" do
        user_params = UserParams.new('checkinguser', 'checkingusername', 'checking@email.com', 'checkingpassword')
        expect(user_params.password_contains_incorrect_characters?).to eq(false)
      end
    end
  end
  describe "#weak_password?" do
    context "given a password under 8 characters" do
      it "returns true" do
        user_params = UserParams.new('checkinguser', 'checkingusername', 'checking@email.com', 'check')
        expect(user_params.weak_password?).to eq(true)
      end
    end
    context "given a password without a number" do
      it "returns true" do
        user_params = UserParams.new('checkinguser', 'checkingusername', 'checking@email.com', 'checkingpassword')
        expect(user_params.weak_password?).to eq(true)
      end
    end
  end
  describe "#duplicate_username?" do
    context "given a duplicate username" do
      it "returns true" do
        user_params = UserParams.new('checkinguser', 'username1', 'checking@email.com', 'check')
        expect(user_params.duplicate_username?).to eq(true)
      end
    end
    context "given a unique username" do
      it "returns false" do
        user_params = UserParams.new('checkinguser', 'uniqueusername1', 'checking@email.com', 'check')
        expect(user_params.duplicate_username?).to eq(false)
      end
    end
  end
  describe "#duplicate_email?" do
    context "given a duplicate email" do
      it "returns true" do
        user_params = UserParams.new('checkinguser', 'checkingusername', 'user1@fakeemail.com', 'check')
        expect(user_params.duplicate_email?).to eq(true)
      end
    end
    context "given a unique email" do
      it "returns false" do
        user_params = UserParams.new('checkingemail', 'checkingusername', 'checking@email.com', 'check')
        expect(user_params.duplicate_email?).to eq(false)
      end
    end
  end
  describe "#invalid_user_params?" do
    it "returns true" do
      user_params = UserParams.new('checking*user', 'checkingusername', 'user1fakeemail.com', 'check')
      expect(user_params.invaild_user_params?).to eq(true)
    end
   
    it "returns false" do
      user_params = UserParams.new('checkingemail', 'checkingusername', 'checking@email.com', 'checkingpassword1')
      expect(user_params.invaild_user_params?).to eq(false)
    end
  end
end

