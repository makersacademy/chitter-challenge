def sign_up(arg=:correct)
  visit '/sign-up'
  if arg == :correct
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
