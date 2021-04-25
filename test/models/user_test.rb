require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: "Bob Ross", 
      email: "bobross@mail.com",
      password: "bobislifebobrossislove", 
      password_confirmation: "bobislifebobrossislove"
    )
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "x" * 16
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "x" * 281 + "@mail.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[
      bobross@mail.com 
      BOB@mail.COM B_O-B@mail.org
      bob.ross@mail.uk 
      bob+ross@mail.rn
    ]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[
      bobross@mail,com
      bobross_at_mail.org bob.ross@example.
      bob@bob_ross.com 
      bob@mail+ross.com
    ]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved to lower case" do
    mixed_case_email = "bObRoSs@mAILl.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " "
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "x"
    assert_not @user.valid?
  end
end
