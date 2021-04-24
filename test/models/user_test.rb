require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "boolean should be true" do
    assert true
  end

  test "should be valid" do
    user = User.new
    assert user.valid?
  end
end
