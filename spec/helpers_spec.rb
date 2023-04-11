require 'spec_helper'
require_relative '../helpers/helpers'
require "rack/test"
include ApplicationHelpers

describe ApplicationHelpers do
  include Rack::Test::Methods

  context 'validators' do
    it "returns true if a user input has malicious characters" do
      expect(ApplicationHelpers.dodgy?("<script>")).to eq true
    end

    it "returns false if a user input is not empty or has malicious characters" do
      expect(ApplicationHelpers.dodgy?("I am a ,!()perfectly @valid input!")).to eq false
    end

    it "returns true if a user input is empty" do
      expect(ApplicationHelpers.dodgy?("")).to eq true
    end

    it "returns true if a user input is just whitespace" do
      expect(ApplicationHelpers.dodgy?("    ")).to eq true
    end
  end

  context 'checks all passed in parameters for invalid input' do
    it "does not trigger reroute if inputs are all valid" do
      expect(ApplicationHelpers.validate("someuser", "somepassword", "someother input")).to eq true
    end

    it "triggers reroute if one of the inputs is invalid" do
      expect(ApplicationHelpers.validate("someuser", "somepass<word")).to eq false
    end
  end

  context 'when passed in the content of a post' do  
    it "scans for any tags and retrieves the username" do
      fake_post = "I am tagging my friend @Useface in here."
      expect(ApplicationHelpers.scan_for_tags_in(fake_post)).to eq ["Useface"]
    end
  
    it 'returns false if there are no tags in the post' do
      fake_post = "I am not really tagging anyhone in here."
      expect(ApplicationHelpers.scan_for_tags_in(fake_post)).to eq false
    end

    it 'returns an array of usernames if there are multiple people tagged in the post' do
      fake_post = "I am tagging @Useface and @Use1000 here."
      expect(ApplicationHelpers.scan_for_tags_in(fake_post)).to eq ["Useface", "Use1000"]
    end
  end

  it 'sends an email with contents if the users username is tagged in a post' do
    current_time = Time.now.strftime("%a, %d %b %Y %H:%M:%S %z")
    email_object = ApplicationHelpers.send_email("user_address@hotmail.com", "Userson Usersmith", "Some random stuff which has @Useface in it.", mail_environment = "test").to_s
    expect(email_object).to include "Date: #{current_time}"
    expect(email_object).to include "To: user_address@hotmail.com"
    expect(email_object).to include "Subject: You have been tagged in Chitter"
    expect(email_object).to include "Userson usersmith, you have been tagged in a post in Chitter!"
    expect(email_object).to include "Some random stuff which has @Useface in it."
  end
end
