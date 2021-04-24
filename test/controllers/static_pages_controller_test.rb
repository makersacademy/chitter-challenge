require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @title = "Chitter"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success #abstract representation of status 200
    assert_select "title", "Home | #{@title}"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@title}"
  end
end
