require 'test_helper'

class ChitterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chitter_index_url
    assert_response :success
  end

end
