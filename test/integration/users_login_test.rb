require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid email and password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { 
      session: { 
        email: "", 
        password: "" 
      } 
    }
    assert_not is_logged_in?
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid email and invalid password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { 
      session: { 
        email: 'bobross@mail.com',
        password: "" 
      } 
    }
    assert_not is_logged_in?
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

end
