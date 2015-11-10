require 'signup_error_handler'

describe SignupErrorHandler do
  context "when passed an error during sign-up validation" do
    let(:errors) {
      [['Username is already taken'],
       ['Username must not be blank'],
       ['Email is already taken'],
       ['Email has an invalid format'],
       ['Email must not be blank'],
       ['Password does not match the confirmation']]
     }

    it "returns :username_error if the username is already taken" do
      expect(described_class.run(errors, :username_error)).to eq :username_error
    end

    it "returns :email_error if the email address is already taken" do
      expect(described_class.run(errors, :email_error)).to eq :email_error
    end

    it "returns :password_error if the passwords do not match" do
      expect(described_class.run(errors, :password_error)).to eq :password_error
    end

  end
end