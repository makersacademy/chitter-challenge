require "test_helper"

class PeepTest < ActiveSupport::TestCase
  def setup
    @user = users(:test)
    @peep = @user.peeps.build(content: "I love Bob", user_id: @user.id)
  end

  test "should be valid" do
    assert @peep.valid?
  end

  test "user id should be present" do
    @peep.user_id = nil
    assert_not @peep.valid?
  end

  test "content should be present" do
    @peep.content = " "
    assert_not @peep.valid?
  end

  test "content should be at most 180 characters" do
    @peep.content = "x" * 181
    assert_not @peep.valid?
  end
end
