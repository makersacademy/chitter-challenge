def sign_up_with_valid_details
  visit '/users/new'
  fill_in :email, with: 'example@example.com'
  fill_in :password, with: 'TopS3cr3t'
  fill_in :password_confirmation, with: 'TopS3cr3t'
  fill_in :name, with: 'John Doe'
  fill_in :username, with: 'JohnDoe'
  click_button 'Sign Up'
end

def sign_up_with_missing_email
  visit '/users/new'
  fill_in :password, with: 'BrillianT'
  fill_in :password_confirmation, with: 'BrillianT'
  fill_in :name, with: 'John Doe'
  fill_in :username, with: 'JohnDoe'
  click_button 'Sign Up'
end

def sign_up_with_missing_password
  visit '/users/new'
  fill_in :email, with: 'example@example.com'
  fill_in :password_confirmation, with: 'TopS3cr3t'
  fill_in :name, with: 'John Doe'
  fill_in :username, with: 'JohnDoe'
  click_button 'Sign Up'
end

def sign_up_with_missing_password_confirmation
  visit '/users/new'
  fill_in :email, with: 'example@example.com'
  fill_in :password, with: 'TopS3cr3t'
  fill_in :name, with: 'John Doe'
  fill_in :username, with: 'JohnDoe'
  click_button 'Sign Up'
end

def sign_up_with_missing_name
  visit '/users/new'
  fill_in :email, with: 'example@example.com'
  fill_in :password, with: 'TopS3cr3t'
  fill_in :password_confirmation, with: 'TopS3cr3t'
  fill_in :username, with: 'JohnDoe'
  click_button 'Sign Up'
end

def sign_up_with_missing_username
  visit '/users/new'
  fill_in :email, with: 'example@example.com'
  fill_in :password, with: 'TopS3cr3t'
  fill_in :password_confirmation, with: 'TopS3cr3t'
  fill_in :name, with: 'John Doe'
  click_button 'Sign Up'
end

def sign_up_with_duplicate_email
  visit '/users/new'
  fill_in :email, with: 'example@example.com'
  fill_in :password, with: 'Bonobo'
  fill_in :password_confirmation, with: 'Bonobo'
  fill_in :name, with: 'Jane Doe'
  fill_in :username, with: 'JaneDoe'
  click_button 'Sign Up'
end

def sign_up_with_duplicate_username
  visit '/users/new'
  fill_in :email, with: 'another@example.com'
  fill_in :password, with: 'TopS3cr3t'
  fill_in :password_confirmation, with: 'TopS3cr3t'
  fill_in :name, with: 'Johnny Doe'
  fill_in :username, with: 'JohnDoe'
  click_button 'Sign Up'
end

def sign_in_with_valid_credentials
  sign_up_with_valid_details
  visit '/sessions/new'
  fill_in :email, with: 'example@example.com'
  fill_in :password, with: 'TopS3cr3t'
  click_button 'Sign In'
end
