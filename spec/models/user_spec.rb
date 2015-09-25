require_relative '../../app/models/user.rb'

describe User do
  def expect_not_to_save_user_with_no property
    user = build(:user, property => "")
    expect(user.save).to be false
  end

  it { should validate_uniqueness_of :email }

  it 'can be saved to database' do
    expect{create :user}.to change(User, :count).by(1)
  end

  it 'email is required in order to be saved to the database' do
    expect_not_to_save_user_with_no :email
  end

  it 'password is required in order to be saved to the database' do
    expect_not_to_save_user_with_no :password_digest
  end
end