require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { 
        name:  "",
        email: "bob@mail",
        password: "bob",
        password_confirmation: "ross" } }
    end
    assert_template 'users/new'
  end
end
