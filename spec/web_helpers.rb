def correct_sign_up
  visit '/sign_up'
  fill_in :name, with: 'Fred'
  fill_in :email, with: 'fred@fred.com'
  fill_in :password, with: 'fred123'
  fill_in :password_confirmation, with: 'fred123'
end

def incorrect_sign_up
  visit '/sign_up'
  fill_in :name, with: 'Fred'
  fill_in :email, with: 'fred@fred.com'
  fill_in :password, with: 'fred123'
  fill_in :password_confirmation, with: 'fred'
end
