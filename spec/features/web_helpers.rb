
def add_email_and_password
  visit '/sign_up'
  fill_in('email', with: '1@1.com')
  fill_in('password', with: '123')
end

def add_password_twice
  visit '/sign_up'
  fill_in('password', with: '1@1.com')
  fill_in('password_confirmation', with: '123')
end
