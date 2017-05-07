def sign_up(arg=:correct)
  visit '/users/new'
  if arg == :email_incorrect
    fill_in 'email_address', with: 'test@example'
  elsif arg == :email_empty
    nil
  else
    fill_in 'email_address', with: 'test@example.com'
  end
  fill_in 'user_name', with: 'chocolate_rain'
  fill_in 'real_name', with: 'Alexander Dominic Chalk'
  fill_in 'password', with: 's3cr3t'
  if arg == :password_failure
    fill_in 'password_confirmation', with: 'not_s3cr3t'
  else
    fill_in 'password_confirmation', with: 's3cr3t'
  end
  click_on 'Sign Up'
end

def sign_up_same_user_name
  visit '/users/new'
  fill_in 'email_address', with: 'second_test@example.com'
  fill_in 'user_name', with: 'chocolate_rain'
  fill_in 'real_name', with: 'Alexander Dominic Chalk'
  fill_in 'password', with: 's3cr3t'
  fill_in 'password_confirmation', with: 's3cr3t'
  click_on 'Sign Up'
end

def sign_up_same_email_address
  visit '/users/new'
  fill_in 'email_address', with: 'test@example.com'
  fill_in 'user_name', with: 'second_chocolate_rain'
  fill_in 'real_name', with: 'Alexander Dominic Chalk'
  fill_in 'password', with: 's3cr3t'
  fill_in 'password_confirmation', with: 's3cr3t'
  click_on 'Sign Up'
end
