require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Bob Ross", email: "bobross@mail.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 16
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 281 + "@mail.com"
    assert_not @user.valid?
  end
end
