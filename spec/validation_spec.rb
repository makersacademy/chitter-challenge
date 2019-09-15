require 'validation'

describe Validation do

  describe '.check_email' do
    it 'returns true if a user already exists' do
        truncate_table
        expect(Validation.check_email("invalid_email")).to eq false
    end
  end

  describe '.check_user_exists' do
    it 'returns true if the user already exists' do
        truncate_table
        DatabaseConnection.query("INSERT INTO users (name, email, username, password) VALUES ('Tony Smith', 'tomysmith@gmail.com', 'tony_smith', 'password1234')")
        expect(Validation.check_user_exists("tony_smith")).to eq true
    end

    it "returns false of the user doesn't exist" do
        truncate_table
        expect(Validation.check_user_exists("tony_smith")).to eq false
    end

  end

  describe '.check_log_in' do
    it 'returns the username if the user has logged in successfully' do
        truncate_table
        DatabaseConnection.query("INSERT INTO users (name, email, username, password) VALUES ('Tony Smith', 'tomysmith@gmail.com', 'tony_smith', 'password1234')")
        expect(Validation.check_log_in("tony_smith", "password1234")).to eq "tony_smith"
    end

    it 'returns false if the user has logged in unsuccessfully' do
        truncate_table
        expect(Validation.check_log_in("tony_smith", "password1234")).to eq false
    end

  end


end