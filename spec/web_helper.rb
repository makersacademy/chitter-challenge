def visit_sign_up_page
  visit('/')
  click_button('Sign Up')
end

def enter_newusername_and_newpassword
  fill_in 'new_username', :with => "new_user"
  fill_in 'new_password', :with => "new_password"
end
