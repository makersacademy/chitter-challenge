require_relative '../app/models/user'
require 'timecop'

describe User do

  subject(:user) { described_class.new }


  it "should add password_token property when a user requests password recovery" do
    expect{user.generate_token}.to change{user.password_token}
  end

  it "should add password_token_time property when a user requests password recovery" do
    expect{user.generate_token}.to change{user.password_token_time}
  end

  it "should record the time now when password token is requested" do
    Timecop.freeze
    user.generate_token
    expect(user.password_token_time).to eq Time.now
  end

  it "can find a valid password token" do
    user.generate_token
    expect(User.find_user_by_token(user.password_token)).to eq user
  end

  it "does not return the user if token is invalid" do
    user.generate_token
    Timecop.travel(Time.now + 3600)
    expect(User.find_user_by_token(user.password_token)).not_to eq user
  end

end
