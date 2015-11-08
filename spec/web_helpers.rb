def sign_up_with_valid_details
  visit "/users/new"
  fill_in :email, with: "example@example.com"
  fill_in :password, with: "TopS3cr3t"
  fill_in :password_confirmation, with: "TopS3cr3t"
  fill_in :name, with: "John Doe"
  fill_in :username, with: "JohnDoe"
  click_button "Sign Up"
end

def sign_up_with_valid_details_2
  visit "/users/new"
  fill_in :email, with: "joe@example.com"
  fill_in :password, with: "TopS3cr3t"
  fill_in :password_confirmation, with: "TopS3cr3t"
  fill_in :name, with: "Joe Blow"
  fill_in :username, with: "JoeBlow"
  click_button "Sign Up"
end

def sign_up_with_missing_email
  visit "/users/new"
  fill_in :password, with: "BrillianT"
  fill_in :password_confirmation, with: "BrillianT"
  fill_in :name, with: "John Doe"
  fill_in :username, with: "JohnDoe"
  click_button "Sign Up"
end

def sign_up_with_missing_password
  visit "/users/new"
  fill_in :email, with: "example@example.com"
  fill_in :password_confirmation, with: "TopS3cr3t"
  fill_in :name, with: "John Doe"
  fill_in :username, with: "JohnDoe"
  click_button "Sign Up"
end

def sign_up_with_missing_password_confirmation
  visit "/users/new"
  fill_in :email, with: "example@example.com"
  fill_in :password, with: "TopS3cr3t"
  fill_in :name, with: "John Doe"
  fill_in :username, with: "JohnDoe"
  click_button "Sign Up"
end

def sign_up_with_missing_name
  visit "/users/new"
  fill_in :email, with: "example@example.com"
  fill_in :password, with: "TopS3cr3t"
  fill_in :password_confirmation, with: "TopS3cr3t"
  fill_in :username, with: "JohnDoe"
  click_button "Sign Up"
end

def sign_up_with_missing_username
  visit "/users/new"
  fill_in :email, with: "example@example.com"
  fill_in :password, with: "TopS3cr3t"
  fill_in :password_confirmation, with: "TopS3cr3t"
  fill_in :name, with: "John Doe"
  click_button "Sign Up"
end

def sign_up_with_duplicate_email
  visit "/users/new"
  fill_in :email, with: "example@example.com"
  fill_in :password, with: "Bonobo"
  fill_in :password_confirmation, with: "Bonobo"
  fill_in :name, with: "Jane Doe"
  fill_in :username, with: "JaneDoe"
  click_button "Sign Up"
end

def sign_up_with_duplicate_username
  visit "/users/new"
  fill_in :email, with: "another@example.com"
  fill_in :password, with: "TopS3cr3t"
  fill_in :password_confirmation, with: "TopS3cr3t"
  fill_in :name, with: "Johnny Doe"
  fill_in :username, with: "JohnDoe"
  click_button "Sign Up"
end

def sign_in_with_valid_credentials
  sign_up_with_valid_details
  visit "/sessions/new"
  fill_in :email, with: "example@example.com"
  fill_in :password, with: "TopS3cr3t"
  click_button "Sign In"
end

def sign_in_with_valid_credentials_2
  sign_up_with_valid_details_2
  visit "/sessions/new"
  fill_in :email, with: "joe@example.com"
  fill_in :password, with: "TopS3cr3t"
  click_button "Sign In"
end

def sign_in_with_invalid_credentials
  sign_up_with_valid_details
  visit "/sessions/new"
  fill_in :email, with: "nobody@example.com"
  fill_in :password, with: "TopS3cr3t"
  click_button "Sign In"
end

def sign_in_with_valid_credentials_wrong_password
  sign_up_with_valid_details
  visit "/sessions/new"
  fill_in :email, with: "example@example.com"
  fill_in :password, with: "BadPassword"
  click_button "Sign In"
end

def sign_out_after_sign_in
  sign_in_with_valid_credentials
  click_button "Sign Out"
end

def post_a_peep_as_signed_in_user
  sign_in_with_valid_credentials
  click_link "Post"
  fill_in :text, with: "I feel mysterious today!"
  click_button "Peep!"
end

def post_a_peep_as_signed_in_user_2
  sign_in_with_valid_credentials_2
  click_link "Post"
  fill_in :text, with: "Practice makes perfect!"
  click_button "Peep!"
end

def post_a_peep_as_unregistered_user
  visit "/peeps/new"
  fill_in :text, with: "I shouldn't be here"
  click_button "Peep!"
end
