require "test_helper"

class PeepsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @peep = peeps(:one)
  end
end
