def sign_up
  visit('/sign_up')
  fill_in 'name', :with => "Samuel"
  fill_in 'email', :with => "samuel@gmail.com"
  fill_in 'username', :with => "sam123"
  fill_in 'password', :with => "password"
  click_button('sign-up')
end

def not_unique_sign_up
  visit('/sign_up')
  fill_in 'name', :with => "Samuel"
  fill_in 'email', :with => "samuel@gmail.com"
  fill_in 'username', :with => "sam123"
  fill_in 'password', :with => "password"
  click_button('sign-up')
end
