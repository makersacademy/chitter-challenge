require_relative '../../app/models/user.rb'

describe User do
  it 'email is required' do
    user_with_no_email = build(:user, email: "")
    expect(user_with_no_email.save).to be false
  end

  xit 'password is required'
end