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
end