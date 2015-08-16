require_relative '../../app/models/user.rb'

describe User do
  it 'can be saved to database' do
    expect{create :user}.to change(User, :count).by(1)
  end

  it 'email is required' do
    user_with_no_email = build(:user, email: "")
    expect(user_with_no_email.save).to be false
  end

  it 'password is required' do
    user_with_no_password = build(:user, password_digest: "")
    expect(user_with_no_password.save).to be false
  end
end