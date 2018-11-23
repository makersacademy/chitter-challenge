require 'spec_helper'
require 'User'
require 'setup_test_database'

describe User do

  it 'can be created' do
    setup_test_database
    handle = "Test"
    display_name = "Test"
    email = "test@test.com"
    password = "test"
    User.create(handle, display_name, email, password)
    user = DatabaseConnection.query("SELECT * FROM users WHERE handle='#{handle}'").first
    expect(user["display_name"]).to eq display_name
  end

  it 'can be retrieved' do
    setup_test_database
    handle = "Test"
    display_name = "Test"
    email = "test@test.com"
    password = "test"
    DatabaseConnection.query("INSERT INTO users (handle, display_name, email, password) VALUES ('#{handle}', '#{display_name}', '#{email}', '#{password}')")
    user = User.retrieve(user_id: 1)
    expect(user.handle).to eq handle
  end


end
