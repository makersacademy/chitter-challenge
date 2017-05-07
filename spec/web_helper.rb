def visit_sign_up_page
  visit('/')
  click_button('Sign Up')
end

def enter_newusername_and_newpassword
  fill_in 'new_first_name', :with => "test_first_name"
  fill_in 'new_last_name', :with => "test_last_name"
  fill_in 'new_email', :with => "test_email"
  fill_in 'new_username', :with => "test_username"
  fill_in 'new_password', :with => "test_password"
  fill_in 'new_password_confirm', :with => "test_password"
end
