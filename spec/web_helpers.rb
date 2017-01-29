def correct_sign_up
  visit '/sign_up'
  fill_in :name, with: 'Fred'
  fill_in :email, with: 'fred@example.com'
  fill_in :username, with: 'FRED'
  fill_in :password, with: 'fred123'
  fill_in :password_confirmation, with: 'fred123'
end

def incorrect_sign_up
  visit '/sign_up'
  fill_in :name, with: 'Fred'
  fill_in :email, with: 'fred@example.com'
  fill_in :password, with: 'fred123'
  fill_in :password_confirmation, with: 'fred'
end

def no_email_sign_up
  visit '/sign_up'
  fill_in :name, with: 'Fred'
  fill_in :password, with: 'fred123'
  fill_in :password_confirmation, with: 'fred'
end

def incorrect_email_address
  visit '/sign_up'
  fill_in :name, with: 'Fred'
  fill_in :email, with: 'fred.com'
  fill_in :password, with: 'fred123'
  fill_in :password_confirmation, with: 'fred123'
end

def correct_sign_in
  visit '/sign_up'
  fill_in :name, with: 'Fred'
  fill_in :email, with: 'fred@example.com'
  fill_in :username, with: 'FRED'
  fill_in :password, with: 'fred123'
  fill_in :password_confirmation, with: 'fred123'
  visit '/log_in'
  fill_in :email, with: 'fred@example.com'
  fill_in :password, with: 'fred123'
end
