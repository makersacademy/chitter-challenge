def sign_up
  visit '/user/sign_up'
  fill_in('name', with: "Rafi")
  fill_in('user_name', with: "SuperRafi")
  fill_in('email', with: "rafi@superwoman.com" )
  fill_in('password', with: "myPassword123")
  click_button("Sign Up")
end

def sign_up_another_user
  visit '/user/sign_up'
  fill_in('name', with: "Matthew")
  fill_in('user_name', with: "MatthewP")
  fill_in('email', with: "matthew@p.com" )
  fill_in('password', with: "hello123")
  click_button("Sign Up")
end

def sign_up_no_email
  visit '/user/sign_up'
  fill_in('name', with: "Rafi")
  fill_in('user_name', with: "SuperRafi")
  fill_in('email', with: nil )
  fill_in('password', with: "myPassword123")
  click_button("Sign Up")
end

def sign_up_invalid_email
  visit '/user/sign_up'
  fill_in('name', with: "Rafi")
  fill_in('user_name', with: "SuperRafi")
  fill_in('email', with: "hello@hello" )
  fill_in('password', with: "myPassword123")
  click_button("Sign Up")
end

def sign_up_no_username
  visit '/user/sign_up'
  fill_in('name', with: "Rafi")
  fill_in('user_name', with: nil)
  fill_in('email', with: "rafi@superwoman.com" )
  fill_in('password', with: "myPassword123")
  click_button("Sign Up")
end

def sign_in
  visit '/user/sign_in'
  fill_in('email', with: "rafi@superwoman.com")
  fill_in('password', with: "myPassword123")
  click_button("Sign In")
end

def invalid_sign_in
  visit '/user/sign_in'
  fill_in('email', with: "junkemail")
  fill_in('password', with: "myPassword123")
  click_button("Sign In")
end

def new_peep
  visit '/peep/new'
  fill_in('content', with: "Hello world, what a wonderful day! To infinity and beyond!")
  click_button("Post")
end

def a_different_peep
  visit '/peep/new'
  fill_in('content', with: "Perfect peeps are for perfect people")
  click_button("Post")
end
