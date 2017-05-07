def sign_up
  visit '/sign-up'
  fill_in 'email_address', with: 'test@example.com'
  fill_in 'user_name', with: 'chocolate_rain'
  fill_in 'real_name', with: 'Alexander Dominic Chalk'
  fill_in 'password', with: 's3cr3t'
  fill_in 'password_confirmation', with: 's3cr3t'
  click_on 'Sign Up'
end

def sign_up_password_mismatch
  visit '/sign-up'
  fill_in 'email_address', with: 'test@example.com'
  fill_in 'user_name', with: 'chocolate_rain'
  fill_in 'real_name', with: 'Alexander Dominic Chalk'
  fill_in 'password', with: 's3cr3t'
  fill_in 'password_confirmation', with: 'not_s3cr3t'
  click_on 'Sign Up'
end
