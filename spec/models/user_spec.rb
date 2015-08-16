require_relative '../../app/models/user.rb'

describe User do
  it 'email is required' do
    user_with_no_email = build(:user, email: "")
    expect(user_with_no_email.save).to be false
  end

  it 'password is required' do
    user_with_no_password = build(:user, password: "")
    expect(user_with_no_password.save).to be false
  end
end