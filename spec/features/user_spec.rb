require_relative '../../lib/user.rb'

describe User do
  
  it "knows that the user is not signed in by default" do
    user = User.new("user1", "password", false)
    expect(user.logged_in).to eq false
  end

  it "signs-up a user, which writes their details into the users table" do
    User.sign_up("user1", "password1", true)
  end

end